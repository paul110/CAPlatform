# == Schema Information
#
# Table name: boards
#
#  id             :integer          not null, primary key
#  mac            :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  status         :integer          default("offline")
#  metadata       :jsonb
#  name           :string           default("")
#  last_active    :datetime
#  maintype       :string
#  type           :string
#  accepted_links :jsonb
#
class Board < ApplicationRecord

  SketchNotFound = Class.new(RuntimeError)
  include BoardHelper

  before_validation :update_last_active, on: :update
  before_save :add_link_types

  enum status: {
    offline: 0,
    online: 1
  }

  def run
    sync_data
  end

  def get_methods
    {}
  end

  protected

  def broadcast
    Log.sent "Board: #{name}<#{mac}> broadcasting (#{metadata}) to channel"
    ActionCable.server.broadcast 'sketch_channel', message: metadata
  end

  def find_sketch
    logger.debug "Finding sketch for #{mac}"
    # There should be no problem interpolating here because the mac is a db value
    Sketch
      .where(status: :active)
      .where("boards @> '[{\"mac\":\"#{mac}\"}]'")
      .first or alert_error
  end

  def find_boards sketch, key: "from"
    sketch.links.select{ |l| l[key] == mac }
  end

  def add_link_types
    return unless type_changed?
    self.accepted_links = get_methods
  end

  def update_last_active
    return unless status == "online" || status_was == "online"
    self.last_active = Time.now
  end

  def sync board
  end

  # sync the boards which have an ingoing sync_data link from this board
  def sync_data
    sketch = find_sketch
    links = sketch.links.select{ |l| l["logic"] == "sync_data"}
    links.each do |link|
      if link["from"] == mac
        # gets data from this board into the other one
        Board.find_by(mac: link["to"]).sync self
      end
    end
  end

  def alert_error
    Log.create! log_type: "error", message: "Couldn't find active sketch for #{name}<#{mac}>"
    raise SketchNotFound
  end
end
