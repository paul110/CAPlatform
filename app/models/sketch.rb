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
#

class Sketch < ApplicationRecord

  belongs_to :user
  belongs_to :creator, class_name: 'User'

  enum status: {
    closed: 0,
    active: 1
  }
end
