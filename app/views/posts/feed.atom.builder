atom_feed :language => 'en-US' do |feed|
  feed.title @title
  feed.updated @updated
  feed.schema_date @posts.last.created_at

  @posts.each do |post|
    next if post.updated_at.blank?

    feed.entry( post ) do |entry|
      entry.url post_url(post)
      entry.title post.title
      with_format('html') do
        entry.content(render(:partial => 'post_body', :locals => { :post => post }), :type => 'html')
      end
=begin
      entry.content post.body, :type => 'html'

      entry.content.prepend(render :partial => 'shared/captioned_image.html.erb', :locals => { :the_image => post.post_images.ordered.first })
   
      post.post_images.ordered.drop(1).each do |post_image|
        entry.content << (render :partial => 'shared/captioned_image.html.erb', :locals => { :the_image => post_image })
      end
=end   
      post.tags.each do |tag|
        entry.category tag.name
      end
    
      # the strftime is needed to work with Google Reader.
      entry.updated(post.updated_at.strftime("%Y-%m-%dT%H:%M:%SZ"))
    
      entry.author do |author|
        author.name("Masha Lifshin")
      end
    end
  end
end