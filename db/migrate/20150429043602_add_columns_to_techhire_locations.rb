class AddColumnsToTechhireLocations < ActiveRecord::Migration
  def change
    add_column :techhire_locations, :latitude, :float
    add_column :techhire_locations, :longitude, :float
  end
end
