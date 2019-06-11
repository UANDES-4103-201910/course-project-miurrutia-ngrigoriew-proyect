class CommentsController < ApplicationController
	def create
	    @post = Post.find(params[:post_id])
	    @comment = @post.comments.create(comment_params)
	    redirect_to post_path(@post)
      flash[:notice]='Comment posted successfully'
  	end
  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
    flash[:error]='Comment deleted successfully'
  end
  def edit
    @comment = Comment.find(params[:id])
    @post = Post.find(params[:post_id])
  end

  def update
    @post = Post.find(params[:post_id])
      @comment = @post.comments.update(comment_params)
      redirect_to post_path(@post)
      flash[:notice]='Comment updated successfully'

  end

  private
    def comment_params
      params.require(:comment).permit(:body).merge(user_id: current_user.id)
    end
end
