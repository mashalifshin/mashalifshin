class Works < ActiveRecord::Base
  attr_accessible :date, :description, :image, :image_cache, :remove_image, :live, :title

  mount_uploader :image, ImageUploader

  scope :chronological, :conditions => 'live IS TRUE', :order => 'date DESC'

end
