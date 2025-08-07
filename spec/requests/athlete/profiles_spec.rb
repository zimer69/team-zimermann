require 'rails_helper'

RSpec.describe "Athlete::Profiles", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/athlete/profiles/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/athlete/profiles/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/athlete/profiles/update"
      expect(response).to have_http_status(:success)
    end
  end

end
