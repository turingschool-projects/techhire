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

    it "can see links to signup and learn more on the home page" do
      visit ('/')
      within("nav#static-site-nav") do
        expect(page).to have_link("Home")
        expect(page).to have_link("Learn More")
        expect(page).to have_link("Where Is TechHire")
        expect(page).to have_link("Sign Up")
        expect(page).to have_link("Tools/Resources")
      end
    end

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

    it "can signup their company using the signup form and a standard organization type" do
      visit signup_path
      within("#new_company") do
        fill_in 'company[name]', with: "Bob"
        fill_in 'company[organization]', with: "Google"
        select 'Interested Individual', from: 'organization_type'
        fill_in 'company[title]', with: "RoR Developer"
        fill_in 'company[city]', with: "Denver"
        select('Colorado', from: 'company[state]')
        fill_in 'company[zip_code]', with: "80001"
        fill_in 'company[email]', with: "google@email.com"
        check 'company[hiring]'
        fill_in 'company[hire_count]', with: 5
        click_button('Sign Up')
      end
      expect(page).to have_content("Thanks for registering!")
    end

    it "can not signup a company if email validation fails" do
      visit ('/signup')
      within("#new_company") do
        fill_in 'company[name]', with: "Bob"
        fill_in 'company[organization]', with: "Google"
        fill_in 'company[title]', with: "RoR Developer"
        fill_in 'company[city]', with: 'Boulder'
        select('Colorado', from: 'company[state]')
        fill_in 'company[zip_code]', with: "80124"
        fill_in 'company[email]', with: "goog"
        check 'company[hiring]'
        fill_in 'company[hire_count]', with: 5
        click_button('Sign Up')
      end
      expect(current_path).to eq(companies_path)

      expect(page.find('.signup-errors')).to have_content("Sorry, we had problems processing that information. Please fix the following issues: email: is invalid")
    end
  end
end
