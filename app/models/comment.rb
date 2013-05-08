class Comment < ActiveRecord::Base
  before_validation :smart_add_url_protocol

  belongs_to :post

  attr_accessible :approved, :comment, :name, :website, :post_id
  
  validates :comment, :presence => true
  validates :website, :format =>{ :with => /^((http|https):\/\/)?[a-z0-9]+([-.]{1}[a-z0-9]+).[a-z]{2,5}(:[0-9]{1,5})?(\/.)?$/ix, :message => " is not valid" }
  
  scope :chronological, :conditions => 'approved IS TRUE', :order => 'created_at DESC'

  protected

  def smart_add_url_protocol
    unless self.website[/^http:\/\//] || self.website[/^https:\/\//]
      self.website = 'http://' + self.website
    end
  end

end
