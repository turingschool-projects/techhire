require 'rails_helper'

RSpec.describe Admin::UsersController, type: :controller do
  let(:admin) do
    create(:user)
  end

  before(:all) do
    5.times do
      num = rand(1..1000)
      User.create!(name: "Name", email: "this#{num}@email.com", password: "password", password_confirmation: "password")
    end
  end

  before(:each) do
    allow_any_instance_of(ApplicationController).to receive(:current_user)
      .and_return(admin)
  end

  describe "Destroy" do
    it "can delete a user" do
      expect{ delete :destroy, id: User.last.id }.to change(User,:count).by(-1)
    end

    it "redirects back to admin companies index after deletion" do
      delete :destroy, id: User.last.id
      expect(response).to redirect_to(admin_users_path)
    end
  end

  describe "Update" do
    it "can update a user's role" do
      user =  User.first
      post :update, id: user.id, user: { name: "TIMTIM", role: 'admin' }
      expect(response).to redirect_to(admin_users_path)
    end

    it "can update its own account information" do
      get :edit, id: admin.id
      expect(response).to render_template(:edit)

      post :update, id: admin.id, user: { name: "TIMah" }
      expect(response).to redirect_to(admin_users_path)
    end
  end

  describe "Index" do
    it "can see the index of all users" do
      get :index
      expect(response).to render_template(:index)
    end
  end
end
