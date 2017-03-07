# == Schema Information
#
# Table name: boards
#
#  id              :integer          not null, primary key
#  mac             :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  status          :integer          default("offline")
#  metadata        :jsonb
#  last_active     :datetime
#  name            :string           default("")
#  maintype        :string
#  subtype         :string
#  accepted_links  :jsonb
#  register_status :integer          default("unregistered")
#  user_id         :integer
#

FactoryGirl.define do
  factory :board do
    mac "1234"
  end
end
