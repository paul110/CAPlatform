# == Schema Information
#
# Table name: sketches
#
#  id           :integer          not null, primary key
#  links        :jsonb            not null
#  boards       :jsonb            not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  published_at :datetime
#  trashed_at   :datetime
#  status       :integer          default("closed")
#  name         :string           default("")
#  user_id      :integer
#  creator_id   :integer
#  listed       :boolean          default(FALSE)
#  description  :string           default("")
#

class Sketch < ApplicationRecord

  belongs_to :user, optional: true
  belongs_to :creator, class_name: 'User', optional: true

  enum status: {
    closed: 0,
    active: 1
  }

  scope :for_marketplace, -> { where(listed: true).order(id: :asc) }
end
