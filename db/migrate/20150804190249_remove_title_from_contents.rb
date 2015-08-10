class RemoveTitleFromContents < ActiveRecord::Migration
  def change
    remove_column :contents, :title, :string
  end
end
