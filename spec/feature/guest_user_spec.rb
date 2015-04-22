require "rails_helper"

describe "As a guest user" do
  include Capybara::DSL

  it "can see a form on the signup page" do
    visit ('/signup')
    within(".signup_form") do
        expect(page).to have_content("Start hiring")
      within(".signup") do
        expect(page).to have_content("Name (First and Last)")
        expect(page).to have_content("Organization")
        expect(page).to have_content("Title")
        expect(page).to have_content("State")
        expect(page).to have_content("City")
        expect(page).to have_content("Email")
        find_button("Create techHire account")
      end
    end
  end
end
