class AddContentIdToPdf < ActiveRecord::Migration
  def change
    add_column :pdfs, :content_id, :integer
  end
end
