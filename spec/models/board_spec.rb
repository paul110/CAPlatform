# == Schema Information
#
# Table name: boards
#
#

require 'rails_helper'

RSpec.describe Board, type: :model do
  it "is valid" do
    expect(build(:board)).to be_valid
  end
end
