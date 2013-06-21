class PostsController < ApplicationController

  def index
    if params[:tag].nil?
      @posts = Post.chronological.page params[:page]
    else
      @tag = Tag.find_by_param params[:tag]
      @posts = @tag.posts.chronological.page params[:page]
    end

    if params[:comment].nil?
      @comment = Comment.new
    else
      @comment = Post.find(params[:post_id]).comments.build(params[:comment])
      @comment.save
    end
  end

  def show
    @post = Post.find_by_param params[:title]
    @previous_post = @post.previous_chronologically
    @next_post = @post.next_chronologically

    if params[:comment].nil?
      @comment = Comment.new
    else
      @comment = Post.find(params[:post_id]).comments.build(params[:comment])
      @comment.save
    end
  end

  def feed
    @title = "masha lifshin"
    @posts = Post.chronological
    @updated = @posts.first.updated_at

    respond_to do |format|
      format.atom { render :layout => false }
      format.rss { redirect_to feed_path(:format => :atom), :status => :moved_permanently }
    end
  end
end