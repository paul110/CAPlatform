# == Schema Information
#
# Table name: sketches
#
#  id           :integer          not null, primary key
#  links        :jsonb            not null
#  boards       :jsonb            not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  draft_id     :integer
#  published_at :datetime
#  trashed_at   :datetime
#  status       :integer          default("pending")
#

FactoryGirl.define do
  factory :sketch do
    
  end
end
