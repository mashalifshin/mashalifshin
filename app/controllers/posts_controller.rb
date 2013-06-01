class PostsController < ApplicationController

  def index
    if params[:year].nil?
      params[:year] = Post.last.date.year
    end

    @year = params[:year]
    @posts_by_year = Post.chronological.to_a.each_with_object({}){ |post, hash| hash[post.created_at.year] ||= []; hash[post.created_at.year] << post }
    @all_years = @posts_by_year.keys
    @posts = @posts_by_year[@year]

    if params[:comment].nil?
      @comment = Comment.new
    else
      @comment = Post.find(params[:post_id]).comments.build(params[:comment])
      @comment.save
    end
  end

end