# == Schema Information
#
# Table name: external_data
#
#  id          :integer          not null, primary key
#  source_type :integer
#  data        :jsonb
#  name        :string
#  url         :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :external_datum do
    source_type 0
    data ""
    name "MyString"
    url "MyString"
  end
end
