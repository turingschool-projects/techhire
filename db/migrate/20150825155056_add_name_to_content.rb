class AddNameToContent < ActiveRecord::Migration
  def change
    add_column :contents, :name, :string
  end
end
