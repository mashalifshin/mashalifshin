module PostsHelper

  def get_commentor_name comment
    if !comment.name?
      'Anonymous'
    elsif !comment.website?
      comment.name
    else
      link_to comment.name, comment.website
    end
  end

end