require 'rails_helper'

RSpec.describe Admin::CompaniesController, :type => :controller do
  attr_reader :company

  before(:each) do
    @company = create(:company)
    admin = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user)
      .and_return(admin)
  end

  describe "GET #show" do
    it "assigns the requested company to @company" do
      get :show, id: company.id
      expect(assigns(:company)).to eq(company)
    end

    it "renders the :show view" do
      get :show, id: company.id
      expect(response).to render_template(:show)
    end
  end

  describe "DELETE #destroy" do
    it "deletes the company" do
      expect{ delete :destroy, id: company.id }.to change(Company,:count).by(-1)
    end

    it "redirects back to admin companies index after deletion" do
      delete :destroy, id: company.id
      expect(response).to redirect_to(admin_companies_path)
    end
  end

  describe "POST #update" do
    it "updates the status of a company" do
      post :update, id: company.id, company: { status: "contacted" }
      expect(response).to redirect_to(admin_company_path(company.id))
    end

    it "renders show page if unsuccessful"  do
      post :update, id: company.id, company: { pizza: "good" }
      expect(response).to redirect_to(admin_company_path(company.id))
    end
  end

  describe "POST #edit" do
    it "updates a company information" do
      get :edit, id: company.id
      expect(response).to render_template(:edit)

      post :update, id: company.id, company: { name: "Netflix", status: "contacted" }
      expect(response).to redirect_to(admin_company_path(company.id))
    end
  end
end
