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
      visit 'companies'

      within(".uncontacted") do
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

      visit '/admin/companies'

      within(".uncontacted") do
        click_link(companies.first.organization, match: :first)
      end

      expect(page).to have_button("Delete Company")
      click_button("Delete Company")

      expect(current_path).to eq(admin_companies_path)

      expect(Company.count).to eq(4)
    end

  it "views confirmed companies on dashboard" do
    companies = create_list(:company, 10, status: "confirmed")
    login

    visit '/admin/companies'

    expect(current_path).to eq(admin_companies_path)

    within(".confirmed") do
      expect(page).to have_link(companies.first.organization)
      expect(page).to have_link(companies.last.organization)
      expect(companies.first.updated_at <= companies.last.updated_at).to eq(true)
    end
  end

  it "views dead companies on dashboard" do
    companies = create_list(:company, 10, status: "dead")
    login

    visit '/admin/companies'

    expect(current_path).to eq(admin_companies_path)

    within(".dead") do
      expect(page).to have_link(companies.first.organization)
      expect(page).to have_link(companies.last.organization)
      expect(companies.first.updated_at <= companies.last.updated_at).to eq(true)
    end
  end

  it "can click to view details of a company" do
    companies = create_list(:company, 10, status: "uncontacted")
      login

      visit '/admin/companies'

      within(".uncontacted") do
        click_link(companies.first.organization, match: :first)
      end
      expect(current_path).to eq(admin_company_path(companies.first.id))
    end
  end
end
