class RenameTypeInEcomics < ActiveRecord::Migration
  def change
    rename_column :ecomics, :type, :comic_type  
    
  end
end
