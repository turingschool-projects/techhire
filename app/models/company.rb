class Company < ActiveRecord::Base
  include ActiveModel::Dirty

  has_many :notes

  validates :name, :organization, :title, :state, :city, presence: true
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, }
  validates :hire_count, numericality: { only_integer: true, }

  geocoded_by :full_address

  after_validation :geocode, if: ->(obj){(obj.city_changed? || obj.state_changed?)}

  def full_address
    "#{city}, #{state}"
  end

  def d3_coordinates
    slice(:longitude, :latitude)
  end

  STATUS_OPTIONS = { "Uncontacted" => "uncontacted", "Contacted" => "contacted", "Confirmed" => "confirmed", "Dead" => "dead" }
end
