class TechhireLocation < ActiveRecord::Base
  include ActiveModel::Dirty

  geocoded_by :full_address

  after_validation :geocode, if: ->(obj){(obj.city_changed? || obj.state_changed?)}

  def full_address
    "#{city}, #{state}"
  end

  def d3_coordinates
    slice(:longitude, :latitude)
  end
end
