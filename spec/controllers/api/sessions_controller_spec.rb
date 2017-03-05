require 'rails_helper'

RSpec.describe Api::SessionsController, type: :controller do

  describe "GET #create" do
    it "returns http success" do
      get :create, params: { name: "test name", email: "test_email@atrato.com", format: :json }

      expect(response).to have_http_status :created
    end
  end

end
