require 'rails_helper'

RSpec.feature "AdminCompanyManagement", type: :feature do
  describe("an admin can manage the contact details of a company") do
    let(:admin) do
      User.create(email: 'admin@example.com',
      password: 'password',
      role: 1)
    end

    def login
      visit admin_login_path

      within('.login') do
        fill_in 'session[email]', with: admin.email
        fill_in 'session[password]', with: admin.password
      end
      click_link_or_button('Login')
    end

    it "can view the details of a company" do
      companies = create_list(:company, 5, status: "uncontacted")
      login

      within(".uncontacted-companies") do
        click_link(companies.first.organization, match: :first)
      end

      expect(page).to have_content(companies.first.organization)
      expect(page).to have_content(companies.first.name)
      expect(page).to have_content(companies.first.title)
      expect(page).to have_content(companies.first.email)
      expect(page).to have_content(companies.first.city)
      expect(page).to have_content(companies.first.state)
    end

    it "can delete a company" do
      companies = create_list(:company, 5, status: "uncontacted")
      login

      within(".uncontacted-companies") do
        click_link(companies.first.organization, match: :first)
      end

      expect(page).to have_button("Delete Company")
      click_button("Delete Company")
      expect(current_path).to eq(admin_dashboard_index_path)
      expect(Company.count).to eq(4)
    end

    it "can add notes to a contacted company" do
      companies = create_list(:company, 5, status: "contacted")
      login

      within(".contacted-companies") do
        click_link(companies.first.organization, match: :first)
      end
      within(".add_note") do
        fill_in "company[note]", with: "test note"
      end
      #click_link_or_button('Add Note')

      expect(page).to have_content("test note")
      #expect(current_path).to eq(admin_dashboard_index_path)
    end
  end
end
