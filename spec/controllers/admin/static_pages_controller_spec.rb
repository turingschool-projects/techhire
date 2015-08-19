require 'rails_helper'

RSpec.describe Admin::StaticPagesController, type: :controller do
  let(:admin) do
   create(:user)
  end

  before(:each) do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
  end

  before :all do
    Page.count > 0 ? Page.destroy_all : false
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

  describe "Edit home" do
    it "returns http success" do
      get :edit, {:name => 'home'}
      expect(response).to have_http_status(:success)
    end
  end

  describe "Edit learn_more" do
    it "returns http success" do
      get :edit, {:name => 'learn_more'}
      expect(response).to have_http_status(:success)
    end
  end

  describe "Edit tools_resources" do
    it "returns http success" do
      get :edit, {:name => 'tools_resources'}
      expect(response).to have_http_status(:success)
    end
  end

  describe "Edit techhire_locations" do
    it "returns http success" do
      get :edit, {:name => "techhire_locations"}
      expect(response).to have_http_status(:success)
    end
  end
end
