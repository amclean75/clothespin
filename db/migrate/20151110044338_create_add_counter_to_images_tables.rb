class CreateAddCounterToImagesTables < ActiveRecord::Migration
  def change
   		add_column :images, :likes_counter, :integer
  end
end
