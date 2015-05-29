class RemoveCompanyIdFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :company_id
  end

  def down
    add_column :users, :company_id, :integer
  end
end
