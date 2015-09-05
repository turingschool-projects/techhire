require 'rails_helper'

RSpec.feature "CompanySignupSpec", type: :feature do
  describe("Company signup creates a company") do
    let! (:state) { State.create(abbr: "CO", id: 14) }
    let! (:usa_city1) { UsaCity.create(name: "Denver", state_id: 14) }

    it "can signup" do
      visit signup_path

      fill_in "company[name]", with: "Orion"
      fill_in "company[organization]", with: "Google"
      fill_in "company[title]", with: "Web Developer"
      fill_in "company[city]", with: "Denver"
      select "Colorado", from: "company_state"
      fill_in "company[zip_code]", with: "80124"
      fill_in "company[email]", with: "orion@google.com"
      within(".button-center") do
        click_link_or_button('Sign Up')
      end

      expect(current_path).to eq(welcome_path)
      expect(Company.last.interest_hiring?).to eq(false)
    end
  end
end
