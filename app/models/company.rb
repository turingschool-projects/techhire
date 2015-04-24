class Company < ActiveRecord::Base
  include ActiveModel::Dirty

  validates :name, :organization, :title, :state, :city, presence: true
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, }

  geocoded_by :full_address

  after_validation :geocode, if: ->(obj){(obj.city_changed? || obj.state_changed?)}
  before_save :shift_longitude

  def full_address
    "#{city}, #{state}"
  end

  def d3_coordinates
    shift_longitude
    slice(:longitude, :latitude)
  end

  def shift_longitude
    self.longitude = self.longitude - 1 if self.longitude
  end
end
