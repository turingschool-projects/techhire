class DropTechhireLocations < ActiveRecord::Migration
  def change
    drop_table :techhire_locations
  end
end
