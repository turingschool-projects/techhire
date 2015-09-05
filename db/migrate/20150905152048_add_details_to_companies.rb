class AddDetailsToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, "sector", :string
    add_column :companies, "phone", :string
    add_column :companies, "location", :string
  end
end
