class AddNavigationToPage < ActiveRecord::Migration
  def change
    add_column :pages, :navigation, :boolean, default: false
  end
end
