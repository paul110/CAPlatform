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
#  subtype        :string
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

  private

  def add_link_types
    self.accepted_links = BoardHelper.get_accepted_links self.subtype
  end
  def update_last_active
    return unless status == "online" || status_was == "online"
    self.last_active = Time.now
  end
end
