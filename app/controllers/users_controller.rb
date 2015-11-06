class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy, :follow, :unfollow]
	before_action :authenticate_user!, only: [:edit, :profile, :update, :destroy, :follow, :unfollow]
	before_action :authorize_user, only: [:edit, :update, :destroy]
	
	def index 
		@users = User.search(params[:search])
	end
	
	def new 
		@user = User.new 
	end
	
	def show 
		
	end
	
	def edit
		
	end
	
	def profile 
		@user = current_user
		render :show 
	end
	
	def recent
		@user = User.last 
		render :show 
	end
	
	def create 
		@user = User.create(user_params)
		if @user.save 
			session[:user_id] = @user.id
			redirect_to user_path(@user.id), notice: "You are all signed up!"
		else
			render :new 
		end
	end
	
	def update 
		if @user.update(user_params) 
			redirect_to @user, notice: "Account updated!"
		else
			render :edit 
		end
	end
	
	def destroy 
		@user.destroy 
		session[:user_id] = nil 
		redirect_to users_path, notice: "User account was deleted!"
	end
	
	def follow
		@user = current_user
		Relationship.create(follower_id: current_user.id, followed_id: params[:id])
		redirect_to profile_path, notice: "Successfully followed #{@user.username}!"
	end
	
	def unfollow
		@rel = Relationship.find_by(followed_id: @user.id, follower_id: current_user.id)
		@rel.destroy 
		redirect_to profile_path, notice: "Successfully unfollowed #{@user.username}!"
	end
	
	private 
	
	def authorize_user
		unless @user == current_user
			redirect_to root_path, notice: "You do not have permission to do that"
		end
	end
	
	def user_params
		params.require(:user).permit(:username, :email, :password, :password_confirmation, :bio, :brands)
	end
	
	def set_user
		begin
			if params[:username]
				username = params[:username]
				@user = User.where("lower(username) = ?", username.downcase).first 
				unless @user 
					flash[:notice] = "That user could not be found."
					redirect_to root_path
				end
			else
				@user = User.find(params[:id])
			end
	    rescue 
		 	flash[:notice] = "That user could not be found."
		 	redirect_to users_path
		end
	end
end
	