# == Schema Information
#
# Table name: boards
#
#  id          :integer          not null, primary key
#  mac         :string
#  button      :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  status      :integer          default("0")
#  metadata    :jsonb            default("{}")
#  last_active :datetime
#

require 'rails_helper'

RSpec.describe Board, type: :model do
  it "is valid" do
    expect(build(:board)).to be_valid
  end
end
