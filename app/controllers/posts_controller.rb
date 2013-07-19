class PostsController < ApplicationController
	before_action :authenticate_user! #no actions in the post controller will work 
	#without user signing in

	def index
		#Post.all <will show blogs of all users
		@posts = current_user.posts
	end

	def new
		@post = Post.new
	end

	#Actually creates record in databasè
	def create
		@post = Post.new post_params
		#assigns post to current user
		@post.user = current_user

		if @post.save
			redirect_to posts_path
		else
			render :new
		end

	end

	def edit
		@post = current_user.posts.find(params[:id])
		
	end

	def update
		@post = current_user.posts.find(params[:id])

		if @post.update_attributes(post_params)
			redirect_to posts_path
		else
			render :edit
		end
	end

	def destroy
		post = current_user.posts.find(params[:id])
		post.destroy

		redirect_to posts_path
	end
private
	def post_params
		params.require(:post).permit(:title, :body, :image)
	end
end
