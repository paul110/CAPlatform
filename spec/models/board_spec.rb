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
#  type            :string
#  accepted_links  :jsonb
#  register_status :integer          default("unregistered")
#  user_id         :integer
#

require 'rails_helper'

RSpec.describe Board, type: :model do
  it "is valid" do
    expect(build(:board)).to be_valid
  end
end
