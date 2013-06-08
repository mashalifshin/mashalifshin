class PostsController < ApplicationController

  def index
    @posts = Post.chronological.page params[:page]

    if params[:comment].nil?
      @comment = Comment.new
    else
      @comment = Post.find(params[:post_id]).comments.build(params[:comment])
      @comment.save
    end
  end

end