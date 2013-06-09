class PostsController < ApplicationController

  def index
    if params[:tag_name].nil?
      @posts = Post.chronological.page params[:page]
    else
      @tag = Tag.find_by_param params[:tag_name]
      @posts = @tag.posts.chronological.page params[:page]
    end

    if params[:comment].nil?
      @comment = Comment.new
    else
      @comment = Post.find(params[:post_id]).comments.build(params[:comment])
      @comment.save
    end
  end

end