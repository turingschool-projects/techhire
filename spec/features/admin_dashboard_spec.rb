require 'rails_helper'

RSpec.feature "AdminDashboard", type: :feature do
  describe("an admin can see the dashboard") do
    let(:admin) do
      create(:user)
    end

    before(:each) do
      allow_any_instance_of(ApplicationController).to receive(:current_user)
        .and_return(admin)
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

    it "can click a link to manage static content" do
      login(admin)

      expect(current_path).to eq(admin_dashboard_index_path)

      within("li.dropdown-header.manage-static-link") do
        expect(page).to have_content('Manage Static Content')
        click_link_or_button("Manage Static Content")
      end
      expect(current_path).to eq(admin_contents_path)
    end

    it "can click a link to manage home content" do
      login(admin)

      expect(current_path).to eq(admin_dashboard_index_path)

      within("li.dropdown-header.manage-home") do
        expect(page).to have_content('Home')
        click_link_or_button("Home")
      end
      expect(current_path).to eq(admin_static_pages_path('home'))
    end

    it "can click a link to manage map content" do
      login(admin)

      expect(current_path).to eq(admin_dashboard_index_path)

      within("li.dropdown-header.manage-map") do
        expect(page).to have_content('Manage Map')
        click_link_or_button("Manage Map")
      end
      expect(current_path).to eq(admin_static_pages_path("techhire_locations"))
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

    it "can click a link to manage tools and resources content" do
      login(admin)

      expect(current_path).to eq(admin_dashboard_index_path)

      within("li.dropdown-header.manage-tools") do
        expect(page).to have_content('Tools/Resources')
        click_link_or_button("Tools/Resources")
      end
      expect(current_path).to eq(admin_static_pages_path('tools_resources'))
    end

    it "can click a link to manage Learn More content" do
      login(admin)

      expect(current_path).to eq(admin_dashboard_index_path)

      within("li.dropdown-header.manage-learn") do
        expect(page).to have_content('Learn More')
        click_link_or_button("Learn More")
      end
      expect(current_path).to eq(admin_static_pages_path('learn_more'))
    end

    it "can click a link to view the home page" do
      login(admin)

      expect(current_path).to eq(admin_dashboard_index_path)

      within("li.view-home") do
        expect(page).to have_content('Home')
        click_link_or_button("Home")
      end
      expect(current_path).to eq(home_path)
    end

    it "can click a link to view the tools and resources page" do
      login(admin)

      expect(current_path).to eq(admin_dashboard_index_path)

      within("li.view-tools-resources") do
        expect(page).to have_content('Tools/Resources')
        click_link_or_button("Tools/Resources")
      end
      expect(current_path).to eq(tools_resources_path)
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

    it "can click a link to view the learn more page" do
      login(admin)

      expect(current_path).to eq(admin_dashboard_index_path)

      within("li.view-learn-more") do
        expect(page).to have_content('Learn More')
        click_link_or_button("Learn More")
      end
      expect(current_path).to eq(learn_more_path)
    end

    it "can click a link to view the techhire locations page" do
      login(admin)

      expect(current_path).to eq(admin_dashboard_index_path)

      within("li.view-techhire-locations") do
        click_link_or_button('Where Is TechHire')
      end
      expect(current_path).to eq(techhire_locations_path)
    end

    it "can see a link to Admin Dashboard if logged in as Admin" do
      login(admin)
      expect(current_path).to eq(admin_dashboard_index_path)
      visit root_path
      expect(page).to have_link('Admin Dashboard')
    end
  end
end
