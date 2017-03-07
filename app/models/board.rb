# == Schema Information
#
# Table name: boards
#
#  id              :integer          not null, primary key
#  mac             :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  status          :integer          default("offline")
#  metadata        :jsonb
#  last_active     :datetime
#  name            :string           default("")
#  maintype        :string
#  subtype         :string
#  accepted_links  :jsonb
#  register_status :integer          default("unregistered")
#  user_id         :integer
#

class Board < ApplicationRecord
  include BoardHelper


  belongs_to :user, optional: true
  before_validation :update_last_active, on: :update
  before_save :add_link_types

  enum status: {
    offline: 0,
    online: 1
  }

  enum register_status: {
    unregistered: 0,
    pending: 1,
    registered: 2
  }

  private

  def add_link_types
    return unless subtype_changed?
    self.accepted_links = get_accepted_links subtype
  end

  def update_last_active
    return unless status == "online" || status_was == "online"
    self.last_active = Time.now
  end
end
