require "rails_helper"

RSpec.describe StaticPagesController, :type => :controller do

  describe "GET home" do
    it "returns http success" do
      get :home
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET learn_more" do
    it "returns http success" do
      get :learn_more
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET tools_resources" do
    it "returns http success" do
      get :tools_resources
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET locations" do
    it "returns http success" do
      get :locations
      expect(response).to have_http_status(:success)
    end
  end
end
