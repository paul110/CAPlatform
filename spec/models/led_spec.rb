#

require 'rails_helper'
require 'spec_helper'

RSpec.describe Led, type: :model do
  let!(:led1) { create(:board, mac: "1234", type: "Led") }

  it "is valid" do
    expect(build(:board)).to be_valid
  end

  it "has a valid factory" do
    FactoryGirl.create(:led).should be_valid
  end

  describe ".current_value" do
    it "returns pin value" do
      [0, 1].each do |value|
        led = FactoryGirl.create(:led, mac: "1", metadata: { Led::LED_PIN => value})
        expect( led.send(:current_value) ).to eq value
      end
    end
  end


  describe ".update_board" do
    it "sets the correct value" do
      led1 = FactoryGirl.create(:led, mac: "1")
      led2 = FactoryGirl.create(:led, mac: "2")

      led1.send(:update_board, 1)
      led2.send(:update_board, 0)

      expect( led1.send(:current_value) ).to eq 1
      expect( led2.send(:current_value) ).to eq 0
    end
  end

  describe ".toggle" do
    it "flips the led value" do
      led = FactoryGirl.create(:led, mac: "1")
      [0, 1].each do | value |
        led.send(:update_board, value)
        led.send(:toggle)
        expect( led.send(:current_value) ).to eq (value+1)%2
      end
    end
  end

end
