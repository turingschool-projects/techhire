require 'rails_helper'

RSpec.feature "AdminContentManagement", type: :feature do
  let(:admin) do
    create(:user)
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
