class State < ActiveRecord::Base
  has_many :usa_cities
  default_scope { order('id ASC') }
end
