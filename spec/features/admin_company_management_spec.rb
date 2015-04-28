require 'rails_helper'

RSpec.feature "AdminCompanyManagement", type: :feature do
  describe("an admin can manage the contact details of a company") do
    let(:admin) do
      User.create(email: 'admin@example.com', password: 'password')
    end

    def login
      visit new_user_session_path

      fill_in 'user[email]', with: admin.email
      fill_in 'user[password]', with: admin.password
      click_link_or_button('Log in')
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
      expect(page).to have_content(companies.first.status.capitalize)
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

    it "can update the status of a company" do
      company = create(:company)
      login

      within(".uncontacted-companies") do
        click_link(company.organization)
      end

      select "Contacted", :from => "company_status"
      click_button("Update Status")

      expect(Company.first.status).to eq("contacted")
    end
  end
end
