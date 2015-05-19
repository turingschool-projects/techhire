class AddColumnsToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :zip_code, :string
    add_column :companies, :organization_type, :string
    add_column :companies, :techhire_interest, :string
    add_column :companies, :techhire_involvement, :string
  end
end
