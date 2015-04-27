require 'rails_helper'

RSpec.feature "AdminDashboard", type: :feature do
  describe("an admin can see the dashboard with companies") do
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

   it "can click a link to view and manage the companies page" do
      login

      expect(current_path).to eq(admin_dashboard_index_path)

      within('.navbar-header') do
        expect(page).to have_content('Companies')
        click_link_or_button('Companies')
      end

      expect(current_path).to eq(admin_companies_path)
    end

    it "can click a link to manage static content" do
      login

      expect(current_path).to eq(admin_dashboard_index_path)

      within("li.manage-static-link") do
        expect(page).to have_content('Manage Static Content')
      end
    end

    it "can click a link to manage home content" do
      login

      expect(current_path).to eq(admin_dashboard_index_path)

      within("li.manage-home") do
        expect(page).to have_content('Home')
      end
    end

    it "can click a link to manage map content" do
      login

      expect(current_path).to eq(admin_dashboard_index_path)

      within("li.manage-map") do
        expect(page).to have_content('Manage Map')
      end
    end

    it "can click a link to manage PDF files content" do
      login

      expect(current_path).to eq(admin_dashboard_index_path)

      within("li.manage-pdf") do
        expect(page).to have_content('Manage PDF Files')
      end
    end

    it "can click a link to manage video content" do
      login

      expect(current_path).to eq(admin_dashboard_index_path)

      within("li.manage-video") do
        expect(page).to have_content('Manage Video Files')
      end
    end

    it "can click a link to manage tools and resources content" do
      login

      expect(current_path).to eq(admin_dashboard_index_path)

      within("li.manage-tools") do
        expect(page).to have_content('Tools/Resources')
      end
    end

    it "can click a link to manage Learn More content" do
      login

      expect(current_path).to eq(admin_dashboard_index_path)

      within("li.manage-learn") do
        expect(page).to have_content('Learn More')
      end
    end

    it "can click a link to manage sign up content" do
      login

      expect(current_path).to eq(admin_dashboard_index_path)
      within("li.manage-sign-up") do
        expect(page).to have_content('Sign Up')
      end
      expect(current_path).to eq(admin_company_path(companies.last.id))
    end
  end
end
