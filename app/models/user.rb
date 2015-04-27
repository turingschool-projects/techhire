class User < ActiveRecord::Base
  has_secure_password

  enum role: %w(company admin super_admin)

  def admin?
    role == "admin" || role == "super_admin"
  end
end
