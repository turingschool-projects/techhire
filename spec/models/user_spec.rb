require 'rails_helper'

RSpec.describe User, type: :model do
  let(:admin) {create(:admin)}
  let(:super_admin) {create(:super_admin)}
  let(:user) {create(:user)}

  describe "admin?" do
    it "returns true if user is admin" do
      expect(admin.admin?).to be_truthy
    end

    it "returns true if user is super admin" do
      expect(super_admin.admin?).to be_truthy
    end

    it "return false if user is not admin" do
      expect(user.admin?).to be_falsy
    end
  end

  describe "Company?" do
    it "returns true if role is company" do
      expect(user.company?).to be_truthy
    end

    it "returns false if role is not company" do
      expect(admin.company?).to be_falsy
    end
  end
end
