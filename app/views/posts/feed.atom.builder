atom_feed :language => 'en-US' do |feed|
  feed.title @title
  feed.updated @updated

  @posts.each do |post|
    next if post.updated_at.blank?

    feed.entry( post ) do |entry|
      entry.title post.title
      with_format('html') do
        entry.content(render(:partial => 'post_body', :locals => { :post => post }), :type => 'html')
      end

      post.tags.each do |tag|
        entry.category tag.name
      end
    
      entry.author do |author|
        author.name("Masha Lifshin")
      end
    end
  end
end