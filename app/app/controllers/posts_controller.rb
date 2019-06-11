class PostsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_post, only: [:upvote,:downvote]
	def index
    	@us= User.where(["id=?",current_user[:id].to_s])
		@posts = Post.where(["user_id = ? ", current_user[:id].to_s])

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
 		pd= Post.find(params[:id]).ds
 		pd1 = Post.find(params[:id]).title
 		pd2 = Post.find(params[:id]).description
 		pd3 = Post.find(params[:id]).city
  		if @post.update(post_params)
  			if current_user.set == 1 || current_user.set == 2

	    		if @post.update(ds_params)

			    	if @post.ds == true
			    		if @post.ds == pd
			        		redirect_to dumpster_path
			        		flash[:error] = "Please uncheck the box to restore the post"
			        	else
				          redirect_to alpost_index_path
				          flash[:notice] = "Post moved to dumpster succesfully"
				        end

			        else
			        	if @post.ds == pd
			        		redirect_to alpost_index_path
			        		flash[:error] = "Please check the box to move the post to dumpster"
			        	else
				          redirect_to dumpster_path
				          flash[:notice] = "Post restored succesfully"
				        end
			        end
		      else
		        redirect_to alpost_index_path
		        flash[:notice] = "Updated succesfully"
		      end
		    else
		    	redirect_to posts_path
		    	flash[:notice] = "Post updated succesfully"
		    end
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
    		params.require(:post).permit(:title, :description, :city, :status, :avatar, :file)
  		end

  		def ds_params
	      params.require(:post).permit(:ds)
	    end
end
