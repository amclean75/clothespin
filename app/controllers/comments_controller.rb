class CommentsController < ApplicationController
	
	def create 
		@image = Image.find(params[:image_id])
		Comment.create(comment_params)
		redirect_to @image, notice: "New comment created!"
	end
	
	def destroy 
		@image = Image.find(params[:image_id])
		@comment = Comment.find(params[:id])
		if @comment.destroy
			redirect_to @image, notice: "That comment was deleted!"
		else
			redirect_to @image, notice: "Something went wrong"
		end
	end
	
	private
	
	def comment_params
		params.require(:comment).permit(:body).merge(user: current_user, image: @image)
	end
end