class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :url
      t.string :page
      t.integer :slot
      t.string :title

      t.timestamps null: false
    end
  end
end
