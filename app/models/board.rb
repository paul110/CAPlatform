# == Schema Information
#
# Table name: boards
#
#  id          :integer          not null, primary key
#  mac         :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  status      :integer          default("offline")
#  metadata    :jsonb
#  last_active :datetime
#  name        :string           default("")
#  maintype    :string
#  subtype     :string
#

class Board < ApplicationRecord
  before_validation :update_last_active, on: :update

  enum status: {
    offline: 0,
    online: 1
  }

  private

  def update_last_active
    return unless status == "online" || status_was == "online"
    self.last_active = Time.now
  end
end
