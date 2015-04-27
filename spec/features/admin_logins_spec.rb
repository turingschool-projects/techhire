require 'rails_helper'

RSpec.feature "AdminLogins", type: :feature do
  describe("an admin can login") do
    let(:admin) do
      User.create(email: 'admin@example.com',
                  password: 'password',
                  role: 1)
    end

    it "visits login" do
      visit admin_login_path

      within('.login') do
        fill_in 'session[email]', with: admin.email
        fill_in 'session[password]', with: admin.password
      end
      click_link_or_button('Login')

      expect(current_path).to eq(admin_dashboard_index_path)
    end

    it "doesn't allow non-users to login" do
      visit admin_login_path

      within('.login') do
        fill_in 'session[email]', with: 'user@example.com'
        fill_in 'session[password]', with: 'password'
      end
      click_link_or_button('Login')

      expect(current_path).to eq(admin_login_path)
    end

    it "doesn't allow non-admin users to login and view admin dashboard" do
      user = User.create(email: 'user@example.com', password: 'password')
      visit admin_login_path

      within('.login') do
        fill_in 'session[email]', with: user.email
        fill_in 'session[password]', with: user.password
      end
      click_link_or_button('Login')

      expect(current_path).to_not eq(admin_login_path)
      expect(current_path).to_not eq(admin_dashboard_index_path)
    end
  end
end
