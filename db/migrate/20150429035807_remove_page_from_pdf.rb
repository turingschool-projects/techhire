class RemovePageFromPdf < ActiveRecord::Migration
  def change
    remove_column :pdfs, :page
  end
end
