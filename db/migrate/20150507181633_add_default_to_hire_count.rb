class AddDefaultToHireCount < ActiveRecord::Migration
  def change
    remove_column :companies, :hire_count
    add_column :companies, :hire_count, :integer, default: 0
  end
end
