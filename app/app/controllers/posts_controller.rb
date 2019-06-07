class PostsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_post, only: [:upvote,:downvote]
	def index
    	@us= User.where(["id=?",current_user[:id].to_s])
		@posts = Post.where(["user_id = ? ", current_user[:id].to_s])
		
  end
	end

	def show   
    	@post = Post.find(params[:id])
 	end	

	def new
		@post = Post.new
	end

	def edit
  		@post = Post.find(params[:id])
	end

	def create
		@post = Post.new(post_params)
    	@post.user = current_user
		if @post.save
  			redirect_to @post
		else
  			render 'new'
		end
	end

	def update
  		@post = Post.find(params[:id])
 
  		if @post.update(post_params)
    		redirect_to @post
  		else
    		render 'edit'
  		end
	end

	def destroy
  		@post = Post.find(params[:id])
  		@post.destroy
 
  		redirect_to posts_path
	end

	#Upvote_from user
	def upvote
		@post.upvote_from current_user
		redirect_to posts_path
	end

	def downvote
		@post.downvote_from current_user
		redirect_to posts_path
	end
 
	private
		def set_post
			@post = Post.find(params[:id])
		end
  		def post_params
    		params.require(:post).permit(:title, :description, :city, :status, :avatar)
  		end
end
