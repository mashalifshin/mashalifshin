class PostImage < ActiveRecord::Base
  belongs_to :post
  
  mount_uploader :image, ImageUploader

  scope :ordered, :order => 'image_order ASC'
end
