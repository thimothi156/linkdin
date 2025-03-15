class PostsController < ApplicationController
	before_action :load_post,only:[:update,:destroy]
	def create 
		post = @user.posts.build(post_params)
	   if post.save
		   render json:{message:"created post succssfully"}
	     else
	     	render json:{errors:[message:post.errors.full_messages]},status: :unprocessable_entity
	     end 
	end 

	def index
      posts = Post.order(created_at:"DESC").eager_load(:user).left_joins(:comments, :likes) .select("posts.*, COUNT(DISTINCT comments.id) AS comments_count, COUNT(DISTINCT likes.id) AS likes_count").group("posts.id,users.id") .page(params[:page]|| 1) .per(15)
     render json: { posts: PostsSerializer.new(posts) }, status: :ok
     end

	def user_posts
		posts = @user.posts.limit(2)
		if  params[:page]
			posts = @user.posts.eager_load(:comment,:likes)
		else
			posts = posts.eager_load(:comment,:likes)
		end
		render json:{posts:PostsSerializer.new(posts)},status: :ok
	end 

   def update 
      post = @post.update(post_params)
      if post
      	render json:{message:"post is updated succssfully"},status: :ok
      else
      	render json:{errors:@post.errors.full_messages},status: :unprocessable_entity
      end 
   end 

   def destroy
      @post.destroy
      render json:{message:"destroyed the post succssfully"}
   end 

	private 

	def post_params 
		params.permit(:description,images:[])
	end 

	def load_post 
		@post = Post.find(params[:id])
	end 
end
