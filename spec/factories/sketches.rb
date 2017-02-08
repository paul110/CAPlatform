# == Schema Information
#
# Table name: sketches
#
#  id         :integer          not null, primary key
#  links      :jsonb            default("\"[]\""), not null
#  boards     :jsonb            default("\"[]\""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :sketch do
    
  end
end
