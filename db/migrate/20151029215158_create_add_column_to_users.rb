class CreateAddColumnToUsers < ActiveRecord::Migration
  def change
	  add_column :users, :username, :string
	  add_column :users, :bio, :text
	  add_column :users, :gender, :integer 
	  add_column :users, :brands, :string 
   end
end
