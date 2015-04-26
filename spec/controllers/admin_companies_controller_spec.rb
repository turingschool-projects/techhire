require 'rails_helper'

RSpec.describe CompaniesController, :type => :controller do

  it "can show a company" do
    company_params = {
      name: 'Bob',
      organization: 'Google',
      title: 'RoR',
      state: 'CO',
      city: 'Denver',
      email: 'google@email.com'
    }
    post :create, company: company_params
    assert_redirected_to root_path
    expect(assigns(:company)).not_to be_nil
    expect(assigns(:company)).to be_a(Company)
  end
end
