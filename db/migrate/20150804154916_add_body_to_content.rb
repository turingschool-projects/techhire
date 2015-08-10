class AddBodyToContent < ActiveRecord::Migration
  def change
    add_column :contents, :body, :string
  end
end
