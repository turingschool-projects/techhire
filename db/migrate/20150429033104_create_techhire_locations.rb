class CreateTechhireLocations < ActiveRecord::Migration
  def change
    create_table :techhire_locations do |t|
      t.string :city
      t.string :state

      t.timestamps null: false
    end
  end
end
