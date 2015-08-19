class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :name, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  scope :admin, -> { where admin: '1'}

  enum role: %w(company admin super_admin)

  ROLE_OPTIONS = { "Company" => "company",
                   "Admin"   => "admin"}

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
