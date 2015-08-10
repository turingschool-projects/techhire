require 'rails_helper'

RSpec.feature "AdminContentManagement", type: :feature do
  it "should be able to add new content" do
    visit "admin/contents"
    fill_in "content[body]", with: "<h1>My body is ready.</h1>"
    click_button "Submit"

    expect(page).to have_content("Content successfully created.")
    expect(current_path).to eql(admin_contents_path)
    expect(page).to have_selector("#table-row", count:1)
  end

  it "should not be able to add content with blank body" do
    visit "admin/contents"
    fill_in "content[body]", with: ""
    click_button "Submit"

    expect(page).to have_content("The body can't be blank.")
  end
end
