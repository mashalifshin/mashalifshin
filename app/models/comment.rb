class Comment < ActiveRecord::Base
=begin
    The website validation is broken
  before_validation :smart_add_url_protocol
=end

  belongs_to :post
  
  validates :comment, :presence => true
=begin
  The website validation is broken
  validates :website, :format =>{ :with => /^((http|https):\/\/)?[a-z0-9]+([-.]{1}[a-z0-9]+).[a-z]{2,5}(:[0-9]{1,5})?(\/.)?$/ix, :message => " is not valid" }
=end

  scope :chronological, :conditions => 'approved IS TRUE', :order => 'created_at DESC'

=begin
  The website validation is broken
  protected

  def smart_add_url_protocol
    unless self.website[/^http:\/\//] || self.website[/^https:\/\//]
      self.website = 'http://' + self.website
    end
  end
=end

end
