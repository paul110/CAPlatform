# == Schema Information
#
# Table name: boards
#
#  id          :integer          not null, primary key
#  mac         :string
#  button      :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  status      :integer          default("offline")
#  metadata    :jsonb
#  last_active :datetime
#  name        :string           default("")
#

FactoryGirl.define do
  factory :board do
    mac "1234"
  end
end
