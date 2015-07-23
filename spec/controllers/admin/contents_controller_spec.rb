require 'rails_helper'

RSpec.describe Admin::ContentsController, type: :controller do

  let(:admin) do
    User.create(email: "tim@example.com", password: "password", password_confirmation: "password", role: 2)
  end

  before(:each) do
    @content = Content.create(title: "Best title Ever", body: "Yeah, the title is cool, but have you read the body?")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
  end

  describe "GET #show" do
    it "renders the :show view" do
      get :show, id: @content.id
      expect(response).to render_template(:show)
    end
  end

  describe "DELETE #destroy" do
    it "deletes the content" do
      expect(Content.count).to eq(1)
      delete :destroy, id: @content.id
      expect(Content.count).to eq(0)
    end

    it "redirects back to admin content index after deletion" do
      delete :destroy, id: @content.id
      expect(response).to redirect_to(admin_contents_path)
    end
  end

  describe "PATCH #update" do
    it "updates the status of a content" do
      patch :update, id: @content.id, content: { title: "Newish Title" }
      expect(response).to redirect_to(admin_content_path(@content.id))
    end
  end

  describe "POST #edit" do
    it "updates a content information" do
      get :edit, id: @content.id
      expect(response).to render_template(:edit)

      post :update, id: @content.id, content: { title: "Just a Word", body: "lots of words" }
      expect(response).to redirect_to(admin_content_path(@content.id))
    end
  end
end
