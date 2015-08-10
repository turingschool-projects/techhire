class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :name
      t.integer :number_of_locations
      t.text :template

      t.timestamps null: false
    end
  end
end
