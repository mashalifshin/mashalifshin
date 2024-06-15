class CommentsController < ApplicationController

  def create
    @post = Post.find_by_param(params[:post_id])
    @comment = @post.comments.build(comment_params)
      if @comment.save
        redirect_to(posts_path(:anchor => get_anchor_name(@post.title)))
      else
        redirect_to(posts_path(params, :anchor => "#{get_anchor_name(@post.title)}_comment_form"))
      end
  end

  private

  def comment_params
    params.require(:comment).permit(:approved, :comment, :name, :website, :post_id)
  end

end
