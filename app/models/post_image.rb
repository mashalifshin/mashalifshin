class PostImage < ActiveRecord::Base
  belongs_to :post
  
  attr_accessible :name, :image_order, :date, :author, :info, :image, :image_cache, :remove_image, :post_id

  mount_uploader :image, ImageUploader

  scope :ordered, :order => 'image_order ASC'
end