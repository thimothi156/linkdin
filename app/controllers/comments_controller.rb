class CommentsController < ApplicationController
	before_action :load_post ,only:[:index]

	def create 
		comment = @user.comments.build(comment_params)
		if comment.save
			render json:{message:"added comment to the pots successfully"}
		else
		render json:{errors:[comment.errors.full_messages]},status: :unprocessable_entity	
		end 
	end 

     def index 
     	  comments =  if params[:page]
     	 	            @post.comments.page(params[:page]).per(8).eager_load(:replies,:user, :likes, replies: [:user, :likes])
     	               else
			     	     @post.comments.limit(2)
			              .eager_load(:replies,:user, :likes, replies: [:user, :likes])
     	               end 
           render json:{comments:CommentsSerializer.new(comments,params:{limit:true})},status: :ok
     end 
     
     def destroy
     	comment = @comment.delete
     	render json:{message:"successfully delete the comment"}
     end 

     def update 
     	comment = @comment.update(comment:param[:text])
     	render json:{message:"comment update successfully",comment:@comment}
     end 

     private 

     def comment_params
     	params.permit(:comment,:parent_id)
     end 

     def load_post
     	@post = Post.find(params[:post_id])
     end 

end
