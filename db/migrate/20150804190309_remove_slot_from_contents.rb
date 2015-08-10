class RemoveSlotFromContents < ActiveRecord::Migration
  def change
    remove_column :contents, :slot, :integer
  end
end
