require 'rails_helper'

RSpec.feature "AdminCompanyUploads", type: :feature do

  describe "uploading companies via csv" do
    let(:admin) do
      User.create(email: 'admin1@example.com', password: 'password', role: 1)
    end

    let(:chump) do
      User.create(email: 'chump@example.com', password: 'password', role: 0)
    end

    let(:csv) { Rails.root.join("spec", "fixtures", "companies.csv")}
    let(:invalid_csv) { Rails.root.join("spec", "fixtures", "invalid_companies.csv")}
    let(:missing_data_csv) { Rails.root.join("spec", "fixtures", "companies_missing_data.csv")}

    it "doesnt allow non-admin" do
      visit new_admin_csv_upload_path
      expect(current_path).to eq(root_path)
      login(chump)
      visit new_admin_csv_upload_path
      expect(current_path).to eq(root_path)
      login(admin)
      visit new_admin_csv_upload_path
      expect(current_path).to eq(new_admin_csv_upload_path)
    end

    it "accepts csv file upload from admins" do
      login(admin)
      visit new_admin_csv_upload_path
      attach_file("companies_csv", csv)
      click_button "Upload"
      expect(current_path).to eq(admin_companies_path)
      expect(Company.last.name).to eq("Pizza Man")
      expect(Company.last.title).to eq("Pizza Chef")
      expect(Company.last.state).to eq("CO")
      expect(Company.last.interest_hiring?).to eq(true)
      expect(Company.last.interest_training?).to eq(false)
    end

    it "displays error unless csv contains proper columns" do
      login(admin)
      visit new_admin_csv_upload_path
      attach_file("companies_csv", invalid_csv)
      click_button "Upload"
      expect(current_path).to eq(admin_csv_uploads_path)
      expect(page).to have_content("Fields not supported")
    end

    it "displays error if companies dont pass validations" do
      login(admin)
      visit new_admin_csv_upload_path
      attach_file("companies_csv", missing_data_csv)
      click_button "Upload"
      # bad csv has 1 co missing a field and 1 with dupe email address
      expect(current_path).to eq(admin_csv_uploads_path)
      expect(page).to have_content("Errors uploading companies")
      expect(page).to have_content("Organization can't be blank")
      expect(page).to have_content("Email has already been taken")
    end
  end
end
