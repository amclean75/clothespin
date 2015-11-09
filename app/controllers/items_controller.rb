class ItemsController < ApplicationController
	
	def create 
		@image = Image.find(params[:image_id])
		@item = Item.create(item_params)
		if @item.save 
			respond_to do |format|
				format.html { redirect_to @image, notice: "New item added!" }
				format.js { flash.now[:notice] = "New item added!"}
			end
		else
			respond_to do |format|
				format.html {redirect_to @image, notice: "There was a problem." }
				format.js { flash.now[:notice] = "There was a problem." }
		  	end
	  	end	
	end
	
	def destroy 
		@image = Image.find(params[:image_id])
		@item = Item.find(params[:id])
		@item.destroy 
			redirect_to @image, notice: "That item was removed!"
	end
	
	private
	
	def item_params
		params.require(:item).permit(:item_type, :description, :url).merge(image: @image)
	end
end