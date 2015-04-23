class AddApprovedToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :status, :string, default: "uncontacted"
  end
end
