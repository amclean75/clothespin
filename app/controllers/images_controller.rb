class ImagesController < ApplicationController
	before_action :set_image, only: [:show, :destroy, :like, :unlike]
	before_action :authenticate_user!, only: [:new, :create, :destroy, :like, :inlike]

	def index 
		@images = Image.where(:user_id => current_user.following)
	end
	
	def new 
		@image = Image.new	
	end
	
	def show
		@item = Item.new 
		@comment = Comment.new
		@like = Like.new
	end
	
	def recent 
		@image = Image.last 
		render :show
	end
	
	def create 
		@image = Image.create(image_params)
		if @image.save 
			redirect_to @image, notice: "New image posted!"
		else 
			render :new 
		end
	end
	
	def like
		@image = Image.find(params[:id])
		Like.create(user: current_user, image: @image)
		redirect_to @image, notice: "You liked the photo!"
	end
	
	def unlike
		@rel = Like.find_by(user_id: current_user, image_id: @image)
		@rel.destroy 
			redirect_to @image, notice: "You unliked the picture!"
	end
	
	def destroy 
		@image.destroy 
		redirect_to images_path, notice: "Image was deleted!"
	end 
	
	private 
	
	def image_params
		params.require(:image).permit(:image).merge(user: current_user) 
	end
	
	def set_image 
		begin 
			@image = Image.find(params[:id])
		rescue 
			flash[:notice] = "That image is not available."
			redirect_to images_path
		end
	end
end