require 'rails_helper'

RSpec.feature "CompanyUserSignUp", type: :feature do
  describe("Company signup creates a user and a company") do
    let! (:state) { State.create(abbr: "CO", id: 14) }

    let! (:usa_city1) { UsaCity.create(name: "Denver", state_id: 14) }

    it "can signup" do
      allow(User).to receive(:generate_password).and_return("abc123abc")
      visit signup_path

      within(".new_company") do
        fill_in "company[name]", with: "Orion"
        fill_in "company[organization]", with: "Google"
        fill_in "company[title]", with: "Web Developer"
        fill_in "company[city]", with: "Denver"
        select "Colorado", from: "company_state"
        fill_in "company[zip_code]", with: "80124"
        fill_in "company[email]", with: "orion@google.com"
        click_link_or_button('Sign Up')
      end

      visit new_user_session_path
      fill_in "user[email]", with: "orion@google.com"
      fill_in "user[password]", with: "abc123abc"
      click_link_or_button("Log in")

      expect(current_path).to eq(company_path(Company.last.id))
      expect(Company.last.hiring?).to eq(false)
      expect(Company.last.hire_count).to eq(0)
    end

    it "accepts hire count information" do
      allow(User).to receive(:generate_password).and_return("abc123abc")
      visit signup_path

      within(".new_company") do
        fill_in "company[name]", with: "Orion"
        fill_in "company[organization]", with: "Google"
        fill_in "company[title]", with: "Web Developer"
        fill_in "company[city]", with: "Denver"
        select "Colorado", from: "company_state"
        fill_in "company[zip_code]", with: "80124"
        fill_in "company[email]", with: "orion@google.com"
        check "company[hiring]"
        fill_in "company[hire_count]", with: "3"
        click_link_or_button('Sign Up')
      end

      visit new_user_session_path
      fill_in 'user[email]', with: "orion@google.com"
      fill_in 'user[password]', with: "abc123abc"
      click_link_or_button('Log in')

      expect(current_path).to eq(company_path(Company.last.id))
      expect(Company.last.hiring?).to eq(true)
      expect(Company.last.hire_count).to eq(3)
    end
  end
end
