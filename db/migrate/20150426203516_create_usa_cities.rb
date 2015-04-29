class CreateUsaCities < ActiveRecord::Migration
  def change
    create_table :usa_cities do |t|
      t.string :name
      t.belongs_to :state, index: true
      t.timestamps null: false
    end
  end
end
