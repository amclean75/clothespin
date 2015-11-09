class CreateDropNameFromBrands < ActiveRecord::Migration
  def change
    	remove_column :brands, :name
    end
end
