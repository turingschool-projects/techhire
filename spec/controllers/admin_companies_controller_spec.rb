require 'rails_helper'

RSpec.describe Admin::CompaniesController, :type => :controller do
  attr_reader :company

  before(:each) do
    @company = create(:company)
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

    it "redirects back to admin dashboard index after deletion" do
      delete :destroy, id: company.id
      expect(response).to redirect_to(admin_dashboard_index_path)
    end
  end
end
