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

include BoardHelper

class Board < ApplicationRecord
  before_validation :update_last_active, on: :update
  before_create :add_link_types

  enum status: {
    offline: 0,
    online: 1
  }

  def run
    ActionCable.server.broadcast 'sketch_channel', message: self.metadata
  end

  protected

  def find_sketch mac
    # There should be no problem interpolating here because the mac is a db value
    Sketch
      .where(status: :active)
      .first or raise "Couldn't find active sketch for #{mac}"
      # .where("boards @> '[{\"mac\":\"#{mac}\"}]'")
  end

  def find_boards mac, sketch, key: "from"
    sketch.links.select{ |l| l[key] == mac }
  end

  def add_link_types
    self.accepted_links = BoardHelper.get_accepted_links self.type
  end

  def update_last_active
    return unless status == "online" || status_was == "online"
    self.last_active = Time.now
  end
end
