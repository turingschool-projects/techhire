class ChangeCompanyInvolvementToText < ActiveRecord::Migration
  def change
    change_column :companies, :techhire_involvement, :text
  end
end
