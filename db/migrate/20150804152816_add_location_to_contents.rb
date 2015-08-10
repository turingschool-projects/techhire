class AddLocationToContents < ActiveRecord::Migration
  def change
    add_column :contents, :location, :integer
  end
end
