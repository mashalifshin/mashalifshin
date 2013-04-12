class CommentsController < ApplicationController
  
  def create
    @comment = Post.find(params[:post_id]).comments.build(params[:comment])
      if @comment.save
        flash[:notice] = "Thank you for contributing your thoughts"
        redirect_to posts_path()
      else
        flash[:error] = "There was a problem with your submission. Please correct the errors below and try again."
        redirect_to posts_path(params)
      end
  end
  
end