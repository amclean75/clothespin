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
		@like = Like.new(user: current_user, image: @image)
		if @like.save 
			respond_to do |format|
				format.html { redirect_to @image, notice: "You liked the photo!" }
				format.js { render :create }
			end
		else 
			respond_to do |format|
				format.html { redirect_to @image, notice: "There was a problem." }
				format.js { flash.now[:notice] = "There was a problem." }
			end
		end
	end
	
	def unlike
		@rel = Like.find_by(user_id: current_user, image_id: @image)
		if @rel.destroy 
			respond_to do |format|
				format.html { redirect_to @image, notice: "You unliked the photo!" }
				format.js { render :create }
			end
		else
			redirect_to @image 
		end
	end
	
	def featured
		@images = Image.order("COALESCE(likes_counter, 0) DESC").limit(10)
		@brands = Brand.all
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