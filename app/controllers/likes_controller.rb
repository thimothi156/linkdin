class LikesController < ApplicationController
	def create 
      if params[:comment_id].present?
      	 @user.likes.create(likeable_type:"Comment",likeable_id:params[:comment_id],type:params[:type])
      elsif params[:post_id].present?
      	@user.likes.create(likeable_type:"Post",likeable_id:params[:post_id],type:params[:type])
      end 
      render json:{message:"successfully added the like"}
	end 

	def index 
		if params[:comment_id].present?
			 likes = Comment.find(params[:comment_id]).likes.includes(:user)
		elsif params[:post_id].present?
			likes = Post.find(params[:post_id]).likes.includes(:user)
		end 
		render json:{likes:LikesSerializer.new(likes)}
	end 
end
