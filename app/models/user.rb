class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    has_many :likes
    has_many :images, dependent: :destroy
    has_many :liked_images, through: :likes, source: "image" #, foreign_key: :image_id 
    has_many :comments, dependent: :destroy
    has_many :active_relationships, class_name: "Relationship", foreign_key: :follower_id, dependent: :destroy
    has_many :passive_relationships, class_name: "Relationship", foreign_key: :followed_id, dependent: :destroy
    has_many :following, through: :active_relationships, source: :followed 
    has_many :followers, through: :passive_relationships, source: :follower

	def self.search(search)
		if search
			self.where('username LIKE ?', "%#{search}%")
		else
			self.all
		end
	end
end
