require 'rails_helper'

RSpec.feature "AdminDashboard", type: :feature do
  describe("an admin can see the dashboard with companies") do
    let(:admin) do
      User.create(email: 'admin@example.com',
                  password: 'password',
                  role: 1)
    end

    before(:each) do
      visit admin_login_path

      within('.login') do
        fill_in 'session[email]', with: admin.email
        fill_in 'session[password]', with: admin.password
      end
      click_link_or_button('Login')
    end

    it "views dashboard" do
      companies = create_list(:company, 10)

      expect(current_path).to eq(admin_dashboard_index_path)
      save_and_open_page
      within(".uncontacted-companies") do
        expect(page).to have_content(companies[0].organization)
      end
    end
  end
end
