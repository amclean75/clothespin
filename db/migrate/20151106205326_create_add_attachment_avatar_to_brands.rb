class CreateAddAttachmentAvatarToBrands < ActiveRecord::Migration
  def self.up
    change_table :brands do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :brands, :avatar
  end
end
