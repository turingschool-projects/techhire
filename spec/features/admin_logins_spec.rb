require 'rails_helper'

RSpec.feature "AdminLogins", type: :feature do
  describe("an admin can login") do
    let(:admin) do
      User.create(email: 'admin@example.com', password: 'password', role: 1)
    end

    it "visits login" do
      visit new_user_session_path

      fill_in 'user[email]', with: admin.email
      fill_in 'user[password]', with: admin.password
      click_link_or_button('Log in')

      expect(current_path).to eq(admin_dashboard_index_path)
    end

    it "doesn't allow non-users to login" do
      visit new_user_session_path

      fill_in 'user[email]', with: 'test@example.com'
      fill_in 'user[password]', with: 'password'
      click_link_or_button('Log in')

      expect(current_path).to eq(new_user_session_path)
    end

    it "doesn't allow non-admin users to login and view admin dashboard" do
      user = User.create(email: 'user@example.com', password: 'password')
      visit new_user_session_path

      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_link_or_button('Log in')

      expect(current_path).to eq(root_path)
    end
  end
end
