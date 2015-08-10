require 'rails_helper'

RSpec.describe Admin::ContentsController, type: :controller do

  let(:admin) do
    User.create(email: "tim@example.com", password: "password", password_confirmation: "password", role: 2)
  end

  before(:each) do
    @content = Content.create(body: "<h2>Yeah, the title is cool, but have you read the body?</h2>", page_id: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
  end

  describe "GET #show" do
    it "renders the :show view" do
      get :show, id: @content.id
      expect(response).to render_template(:show)
    end
  end

  describe "PATCH #update" do
    it "updates the status of a content" do
      patch :update, id: @content.id, content: { body: "<h1>Newish Title</h1>" }
      expect(response).to redirect_to(admin_contents_path)
    end
  end

  describe "POST #edit" do
    it "updates a content information" do
      Page.create!(name: "home")
      get :edit, id: @content.id
      expect(response).to render_template(:edit)

      post :update, id: @content.id, content: { body: "<p>lots of words</p>" }
      expect(response).to redirect_to(admin_contents_path)
    end
  end
end
