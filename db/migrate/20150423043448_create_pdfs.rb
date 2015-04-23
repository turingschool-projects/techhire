class CreatePdfs < ActiveRecord::Migration
  def change
    create_table :pdfs do |t|
      t.string :url
      t.string :page
      t.integer :slot
      t.timestamps null: false
    end
  end
end
