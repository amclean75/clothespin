class Image < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	has_many :likes
	has_many :users, through: :likes
	has_many :items, dependent: :destroy
	belongs_to :user
			
	has_attached_file :image, styles: { medium: "150x150>", thumb: "75x75>" }
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end