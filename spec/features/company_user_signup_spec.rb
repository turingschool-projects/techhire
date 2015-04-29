require 'rails_helper'

RSpec.feature "CompanyUserSignUp", type: :feature do
  describe("Company signup creates a user and a company") do

    it "can signup" do
      visit '/'
      click_link_or_button("Sign Up")
      expect(page).to have_content("Start hiring")

      fill_in 'company[name]', with: "Orion"
      fill_in 'company[organization]', with: "Google"
      fill_in 'company[title]', with: "Web Developer"
      select 'Denver', from: "company_city"
      select 'CO', from: "company_state"
      fill_in 'company[email]', with: "orion@google.com"
      click_link_or_button('Create techHire account')

      expect(current_path).to eq(company_path(Company.last.id))
    end
  end
end
