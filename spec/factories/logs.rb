# == Schema Information
#
# Table name: logs
#
#  id         :integer          not null, primary key
#  log_type   :integer
#  message    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :log do
    log_type 1
    message "MyString"
  end
end
