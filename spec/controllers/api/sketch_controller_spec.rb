require 'rails_helper'

RSpec.describe Api::SketchController, type: :controller do
  let!(:user) { create(:user) }
  let!(:board1) { create(:board, mac: "1234", user: user) }
  let!(:board2) { create(:board, mac: "5678", user: user) }
  let!(:sketch) { create(:sketch, boards: boards, links: links, user: user) }

  describe "PUT #update" do
    it "updates the sketch" do
      put :update, params: sketch_params(logic: "custom_one")

      expect(response).to have_http_status :ok
      expect(json_response.dig("links", 0, "logic")).to eq "custom_one"
    end

  end

  private

  def sketch_params params = {}
    {
      user_id: user.id,
      id: sketch.id,
      boards: boards(params),
      links: links(params),
      status: params.fetch(:status, "active"),
      format: params.fetch(:format, :json)
    }
  end

  def boards params = {}
    [
      {
        mac: board1.mac
      },
      {
        mac: board2.mac
      }
    ]
  end

  def links params = {}
    [
      {
        from: board1.mac,
        to: board2.mac,
        logic: params.fetch(:logic, "toggle")
      }
    ]
  end
end
