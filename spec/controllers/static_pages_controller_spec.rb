require "rails_helper"

RSpec.describe StaticPagesController, :type => :controller do

  before :all do
    ['Home', 'Learn More', 'TechHire Locations', 'Tools and Resources'].each do |name|
      Page.create! do |page|
        page.number_of_locations = 3
        page.name          = name
        page.template      = <<-HTML.strip_heredoc
          <div>
            <h1>There is so much good content on this page</h1>
          </div>
        HTML
      end
    end
  end

  describe "GET home" do
    it "returns http success" do
      get :show, {:name => 'Home'}
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET learn_more" do
    it "returns http success" do
      get :show, {:name => 'Learn More'}
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET tools_resources" do
    it "returns http success" do
      get :show, {:name => 'Tools and Resources'}
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET techhire_locations" do
    it "returns http success" do
      get :show, {:name => "TechHire Locations"}
      expect(response).to have_http_status(:success)
    end
  end

end
