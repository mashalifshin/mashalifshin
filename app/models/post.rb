class Post < ActiveRecord::Base
  has_many :comments
  has_many :post_images, :order => 'image_order ASC'

  attr_accessible :body, :title, :date, :live, :comment_ids, :comments_attributes, :post_image_ids, :post_images_attributes

  accepts_nested_attributes_for :post_images, :allow_destroy => true
  accepts_nested_attributes_for :comments, :allow_destroy => true

  validates :title, :uniqueness => true
  validates :title, :body, :presence => true

  scope :chronological, :order => "created_at ASC", :conditions => 'live IS TRUE'
end
