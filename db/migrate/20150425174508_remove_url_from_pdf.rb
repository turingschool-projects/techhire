class RemoveUrlFromPdf < ActiveRecord::Migration
  def change
    remove_column :pdfs, :url
  end
end
