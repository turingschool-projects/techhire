class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :organization
      t.string :title
      t.string :state
      t.string :city
      t.string :email

      t.timestamps null: false
    end
  end
end
