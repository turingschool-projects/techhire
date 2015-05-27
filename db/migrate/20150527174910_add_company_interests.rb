class AddCompanyInterests < ActiveRecord::Migration
  def change
    remove_column :companies, "techhire_interest", :boolean, :default => false
    add_column :companies, "interest_hiring", :boolean, :default => false
    add_column :companies, "interest_training", :boolean, :default => false
    add_column :companies, "interest_connecting", :boolean, :default => false
    add_column :companies, "interest_supporting", :boolean, :default => false
    add_column :companies, "interest_community", :boolean, :default => false
  end
end
