class AddColumnToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :hiring, :boolean
    add_column :companies, :hire_count, :integer
  end
end
