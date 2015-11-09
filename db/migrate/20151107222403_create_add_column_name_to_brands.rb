class CreateAddColumnNameToBrands < ActiveRecord::Migration
  def change
    	add_column :brands, :name, :integer
    end
end
