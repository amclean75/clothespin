class Brand < ActiveRecord::Base
	belongs_to :user
	
	NAME = ["Nike", "Adidas", "Louis Vuitton", "Dolce & Gabbana", "Michael Kors", "Dior", "Christian Louboutin", "Gucci", "Prada", "Burberry", "Vans", "Fendi", "Armani", "Converse", "Jimmy Choo", "Free People", "Calvin Klein", "Ralph Lauren", "Cartier", "Nautica", "American Eagle", "Banana Republic", "J. Crew"]
	
	def display_name
		NAME[name]
	end
	
	has_attached_file :avatar, styles: { medium: "150x150>", thumb: "75x75>" }
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
