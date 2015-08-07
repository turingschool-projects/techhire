class RemovePageFromContent < ActiveRecord::Migration
  def change
    remove_column :contents, :page, :string
  end
end
