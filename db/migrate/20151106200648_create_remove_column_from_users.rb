class CreateRemoveColumnFromUsers < ActiveRecord::Migration
  def change
   	remove_column :users, :brands
  end
end
