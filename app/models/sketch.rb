# == Schema Information
#
# Table name: sketches
#
#  id           :integer          not null, primary key
#  links        :jsonb            default("[]"), not null
#  boards       :jsonb            default("[]"), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  draft_id     :integer
#  published_at :datetime
#  trashed_at   :datetime
#  status       :integer          default("0")
#

class Sketch < ApplicationRecord
  has_drafts

  enum status: {
    pending: 0,
    active: 1,
    closed: 2
  }
end
