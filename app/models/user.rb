class User < ActiveRecord::Base
  belongs_to :company
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: %w(company admin super_admin)

  def admin?
    role == "admin" || role == "super_admin"
  end

  def company?
    role == "company"
  end

  def self.generate_password
    SecureRandom.urlsafe_base64
  end
end
