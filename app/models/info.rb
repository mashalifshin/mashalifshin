class Info < ActiveRecord::Base
  attr_accessible :about, :resume, :resume_cache, :remove_resume, :crest, :crest_cache, :remove_crest

  mount_uploader :resume, PdfUploader
  mount_uploader :crest, ImageUploader
end
