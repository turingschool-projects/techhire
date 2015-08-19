require 'rails_helper'

RSpec.feature "AdminContentManagement", type: :feature do
  let(:admin) do
    User.create(email: "tim@example.com", password: "password", password_confirmation: "password", role: 2)
  end

  before(:each) do
    allow_any_instance_of(ApplicationController).to receive(:current_user)
      .and_return(admin)
  end

  it "should have all pages" do
    visit admin_contents_path
    expect(page). to have_link("Home Page Content")
    expect(page). to have_link("Map Page Content")
    expect(page). to have_link("Tools and Resources Page Content")
    expect(page). to have_link("Learn More Page Content")
  end
end
