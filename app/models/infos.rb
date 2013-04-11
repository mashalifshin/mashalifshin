class Infos < ActiveRecord::Base
  attr_accessible :about, :resume, :resume_cache, :remove_resume

  mount_uploader :resume, PdfUploader
end
