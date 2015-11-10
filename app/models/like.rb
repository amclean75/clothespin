class Like < ActiveRecord::Base
	belongs_to :user
	belongs_to :image, counter_cache: :likes_counter
end
