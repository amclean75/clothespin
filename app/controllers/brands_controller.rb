class BrandsController < ApplicationController
	
	def create
		@user = User.find(params[:user_id]) 
		@brand = Brand.create(brand_params)
		if @brand.save
			respond_to do |format|
				format.html { redirect_to @user, notice: "New brand added!" }
				format.js { flash.now[:notice] = "New brand added!" }
			end
		else
			respond_to do |format|
				format.html { redirect_to @user, notice: "There was a problem." }
				format.js { flash.now[:notice] = "There was a problem." }
			end
		end
	end
	
	def destroy 
		@user = User.find(params[:user_id])
		@brand = Brand.find(params[:id])
		@brand.destroy
			redirect_to profile_path, notice: "That brand was removed."
	end
	
	private
	
	def brand_params
		params.require(:brand).permit(:name, :url).merge(user: current_user)
	end
end
