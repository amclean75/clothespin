class Item < ActiveRecord::Base
	belongs_to :image
	
	ITEM_TYPE = ["Top", "Pants", "Skirt", "Shoes", "Jacket", "Socks", "Shorts", "Romper", "Dress", "Coat", "Blazer", "Swimwear", "Sunglasses", "Bracelet", "Necklace", "Earings", "Watch", "Ring", "Glasses", "Bag", "Purse", "Wallet", "Wristlet"]
	
	def display_item_type
		ITEM_TYPE[item_type]
	end
end
