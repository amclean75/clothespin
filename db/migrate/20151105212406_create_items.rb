class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :item_type
      t.string :description
      t.string :url
      t.integer :image_id

      t.timestamps null: false
    end
  end
end
