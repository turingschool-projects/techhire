class Company < ActiveRecord::Base
  validates :name, :organization, :title, :state, :city, presence: true
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, }

end
