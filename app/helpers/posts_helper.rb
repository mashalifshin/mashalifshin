module PostsHelper

  def get_commentor_name comment
    if comment.name.nil?
      'Anonymous'
    else
      comment.name
    end
  end

end