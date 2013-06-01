class PostImage < ActiveRecord::Base
  belongs_to :post
  
  attr_accessible :name, :image_order, :image, :image_cache, :remove_image, :post_id

  mount_uploader :image, ImageUploader
end