require 'rails_helper'

RSpec.describe Api::SketchController, type: :controller do
  let!(:board1) { create(:board, mac: "1234") }
  let!(:board2) { create(:board, mac: "5678") }
  let!(:sketch) { create(:sketch, boards: boards, links: links) }

  describe "PUT #update" do
    it "updates the sketch" do
      put :update, params: sketch_params(logic: "custom_one")

      expect(response).to have_http_status :ok
      expect(json_response.dig("links", 0, "logic")).to eq "custom_one"
    end

    it "saves the update as a draft" do
      put :update, params: sketch_params(logic: "custom_one")

      expect(sketch.reload.draft?).to be true
      # Saved logic should be "toggle"
      expect(sketch.links.dig(0, "logic")).to eq "toggle"
      # Draft sketch should have "custom_one"
      expect(sketch.draft.object.dig("links", 0, "logic")).to eq "custom_one"
    end

    it "publishes the draft" do
      # Create a Draft
      put :update, params: sketch_params(logic: "blah")
      sketch.reload
      # Publish the draft
      put :update, params: sketch_params(logic: "custom_one", status: "active")

      expect(sketch.reload.draft?).to be false
      expect(sketch.links.dig(0, "logic")).to eq "custom_one"
    end
  end

  private

  def sketch_params params = {}
    {
      id: sketch.id,
      boards: boards(params),
      links: links(params),
      status: params.fetch(:status, "pending"),
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
