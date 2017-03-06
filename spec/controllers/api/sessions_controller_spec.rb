require 'rails_helper'

RSpec.describe Api::SessionsController, type: :controller do

  describe "POST #create" do
    it "returns http created" do
      post :create, params: { name: "test name", email: "test_email@atrato.com", format: :json }

      expect(response).to have_http_status :created
    end

    it "creates the user" do
      expect {
        post :create, params: { name: "test name", email: "test_email@atrato.com", format: :json }
      }.to change {
        User.count
      }.by 1
    end

    it "sets the user email and name" do
      post :create, params: { name: "test name", email: "test_email@atrato.com", format: :json }

      last_user = User.last
      expect(last_user.name).to eq "test name"
      expect(last_user.email).to eq "test_email@atrato.com"
    end
  end

end
