class PostsController < ApplicationController
  
  def index
    @posts = Posts.chronological
    @comment = Comments.new
  end
  
end