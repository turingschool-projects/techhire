require "rails_helper"

RSpec.feature "Company Signup Page", type: :feature do
  describe "As a guest user, I" do
    include Capybara::DSL

    let! (:state) {
      State.create(
        abbr: "CO",
        id: 14
      )
    }

    let! (:usa_city1) {
      UsaCity.create(
        name: "Denver",
        state_id: 14
      )
    }

    let! (:usa_city2) {
      UsaCity.create(
        name: "Boulder",
        state_id: 14
      )
    }

    let! (:usa_city3) {
      UsaCity.create(
        name: "Dallas",
        state_id: 13
      )
    }

    it "can see a form on the signup page" do
      visit ('/signup')
      expect(page).to have_content("Name (First and Last)")
      expect(page).to have_content("Organization")
      expect(page).to have_content("Title")
      expect(page).to have_content("State")
      expect(page).to have_content("City")
      expect(page).to have_content("Zip Code")
      expect(page).to have_content("Email")
      find_button("Sign Up")
    end

    context "valid signup information" do
      before :each do
        visit signup_path
        fill_in 'company[name]', with: "Bob"
        fill_in 'company[organization]', with: "Google"
        fill_in 'company[title]', with: "RoR Developer"
        fill_in 'company[city]', with: "Denver"
        select('Colorado', from: 'company[state]')
        fill_in 'company[zip_code]', with: "80001"
        fill_in 'company[email]', with: "google@email.com"
      end

      it "can signup their company using the signup form and a standard organization type" do
        select 'Interested Individual', from: 'organization_type'
        click_button('Sign Up')
        expect(page).to have_content("Thanks for registering!")
      end

      it "can signup their company using the signup form and a custom organization type", js: true do
        select 'Other', from: 'organization_type'
        fill_in 'organization_type_other', with: 'After School Club'

        expect{ click_button('Sign Up') }.to change { Company.count }.by(1)
        expect(Company.last.organization_type).to eq('After School Club')
        expect(page).to have_content("Thanks for registering!")
      end
    end
  end
end
