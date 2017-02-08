# == Schema Information
#
# Table name: boards
#
#  id         :integer          not null, primary key
#  uid        :string
#  button     :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :board do
    uid "MyString"
  end
end
