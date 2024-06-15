class Info < ActiveRecord::Base
  mount_uploader :resume, PdfUploader
end
