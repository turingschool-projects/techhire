class RemoveBodyFromContent < ActiveRecord::Migration
  def change
    remove_column :contents, :body, :text
  end
end
