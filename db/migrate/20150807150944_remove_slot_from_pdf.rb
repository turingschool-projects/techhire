class RemoveSlotFromPdf < ActiveRecord::Migration
  def change
    remove_column :pdfs, :slot, :integer
  end
end
