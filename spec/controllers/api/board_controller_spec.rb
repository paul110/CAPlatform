require 'rails_helper'

RSpec.describe Api::BoardController, type: :controller do
  describe "GET #index" do
    let!(:board) { create(:board, mac: "1234", status: "online") }
    let!(:bad_board) { create(:board, mac: nil) }

    it "only shows boards with mac addresses" do
      get :index, format: :json

      expect(json_response.count).to eq 1
      expect(json_response.dig(0, "mac")).to eq board.mac
    end

    it "raises a 406 for bad format" do
      expect{
        get :index, format: :html
      }.to raise_error("ActionController::UnknownFormat")
    end
  end
end
