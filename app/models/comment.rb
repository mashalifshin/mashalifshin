class Comment < ActiveRecord::Base
  belongs_to :post

  attr_accessible :approved, :comment, :name, :website, :post_id
  
  validates :comment, :presence => true
  
  scope :chronological, :conditions => 'approved IS TRUE', :order => 'created_at DESC'
end
