require 'rails_helper'

RSpec.feature "AdminDashboard", type: :feature do
  describe("an admin can see the dashboard") do
    let(:admin) do
      User.create(email: 'admin@example.com', password: 'password', role: 1)
    end

    def login
      visit new_user_session_path

      fill_in 'user[email]', with: admin.email
      fill_in 'user[password]', with: admin.password
      click_link_or_button('Log in')
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

   it "can click a link to return to the admin dashboard page" do
      login

      visit '/admin/companies'

      expect(current_path).to eq(admin_companies_path)

      within('.navbar-header') do
        click_link_or_button('Admin Dashboard')
      end

      expect(current_path).to eq(admin_dashboard_index_path)
    end

    it "can click a link to manage static content" do
      login

      expect(current_path).to eq(admin_dashboard_index_path)

      within("li.dropdown-header.manage-static-link") do
        expect(page).to have_content('Manage Static Content')
      end
    end

    it "can click a link to manage home content" do
      login

      expect(current_path).to eq(admin_dashboard_index_path)

      within("li.dropdown-header.manage-home") do
        expect(page).to have_content('Home')
        click_link_or_button("Home")
      end
      expect(current_path).to eq(admin_static_pages_home_path)
    end

    it "can click a link to manage map content" do
      login

      expect(current_path).to eq(admin_dashboard_index_path)

      within("li.dropdown-header.manage-map") do
        expect(page).to have_content('Manage Map')
      end
      expect(current_path).to eq(admin_static_pages_techhire_locations_path)
    end

    it "can click a link to manage PDF files content" do
      login

      expect(current_path).to eq(admin_dashboard_index_path)

      within("li.dropdown-header.manage-pdf") do
        expect(page).to have_content('Manage PDF Files')
      end
      expect(current_path).to eq(admin_pdfs_path)
    end

    it "can click a link to manage video content" do
      login

      expect(current_path).to eq(admin_dashboard_index_path)

      within("li.dropdown-header.manage-video") do
        expect(page).to have_content('Manage Video Files')
      end
      expect(current_path).to eq(admin_videos_path)
    end

    it "can click a link to manage tools and resources content" do
      login

      expect(current_path).to eq(admin_dashboard_index_path)

      within("li.dropdown-header.manage-tools") do
        expect(page).to have_content('Tools/Resources')
      end
      expect(current_path).to eq(admin_static_pages_tools_resources_path)
    end

    it "can click a link to manage Learn More content" do
      login

      expect(current_path).to eq(admin_dashboard_index_path)

      within("li.dropdown-header.manage-learn") do
        expect(page).to have_content('Learn More')
      end
      expect(current_path).to eq(admin_static_pages_learn_more_path)
    end
  end
end
