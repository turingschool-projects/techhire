require 'rails_helper'

RSpec.feature "AdminDashboard", type: :feature do
  describe("Index page") do
    let(:admin) do
      create(:admin)
    end

    before(:each) do
      allow_any_instance_of(ApplicationController).to receive(:current_user)
        .and_return(admin)
      Page.destroy_all
    end

    it "can click a link to view cms instructions" do
      login(admin)
      within('.navbar-header') do
        click_link_or_button('CMS Instructions')
      end
      expect(current_path).to eq(admin_cms_instructions_path)
      expect(page).to have_content('Content Management System(CMS) Instructions')
    end

    it "can see a list of uncontacted companies on the dashboard" do
      login(admin)
      create(:company)
      visit admin_dashboard_index_path
      expect(current_path).to eq(admin_dashboard_index_path)
      expect(page).to have_content('Google')
      expect(page).to have_content('John')
      expect(page).to have_content('john@example.com')
    end

    it "can see company statistics on Admin Dashboard" do
      create(:company)
      login(admin)
      expect(page).to have_content('Uncontacted Companies: 1')

      within(".companies-by-city") do
        expect(page).to have_content('Top TechHire Cities Denver : 1')
      end
    end

   it "can click a link to view and manage the companies page" do
      login(admin)

      expect(current_path).to eq(admin_dashboard_index_path)

      within('.navbar-header') do
        expect(page).to have_content('Companies')
        click_link_or_button('Companies')
      end

      expect(current_path).to eq(admin_companies_path)
    end

   it "can click a link to return to the admin dashboard page" do
      login(admin)

      visit '/admin/companies'

      expect(current_path).to eq(admin_companies_path)

      within('.navbar-header') do
        click_link_or_button('Admin Dashboard')
      end

      expect(current_path).to eq(admin_dashboard_index_path)
    end

    it "can click a link to view static content index" do
      login(admin)

      expect(current_path).to eq(admin_dashboard_index_path)

      within("li.dropdown-header.manage-static-link") do
        expect(page).to have_content('Manage Static Content')
        click_link_or_button("Manage Static Content")
      end
      expect(current_path).to eq(admin_contents_path)
    end

    it "populates the dropdown with Page model" do
      create(:home_page)
      create(:locations_page)
      create(:learn_page)
      create(:tools_page)
      login(admin)
      expect(Page.count).to eq(4)
      within("ul#edit-static-page") do
        expect(page).to have_selector('li.page', count: 4)
      end

    end

    it "can click a link to manage a speific static page" do
      create(:home_page)
      login(admin)

      expect(current_path).to eq(admin_dashboard_index_path)

      within("ul#edit-static-page") do
        expect(page).to have_content('Home')
        click_link_or_button("Home")
      end
      expect(current_path).to eq(admin_static_pages_path('home'))
    end


    it "can click a link to manage PDF files content" do
      login(admin)

      expect(current_path).to eq(admin_dashboard_index_path)

      within("li.dropdown-header.manage-pdf") do
        expect(page).to have_content('Manage PDF Files')
        click_link_or_button("Manage PDF Files")
      end
      expect(current_path).to eq(admin_pdfs_path)
    end

    it "can click a link to view static pages as a non admin user" do
      create(:home_page)
      login(admin)

      expect(current_path).to eq(admin_dashboard_index_path)

      within("li.user-menu") do
        expect(page).to have_content('Home')
        click_link_or_button("Home")
      end
      expect(current_path).to eq(home_path)
    end

    it "can click a link to view the signup page" do
      login(admin)

      expect(current_path).to eq(admin_dashboard_index_path)

      within("li.view-signup") do
        expect(page).to have_content('Sign Up')
        click_link_or_button("Sign Up")
      end
      expect(current_path).to eq(signup_path)
    end
  end
end
