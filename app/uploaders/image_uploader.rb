class ImageUploader < MashaLifshinUploader

  # 1200+ 
  version :large do
    process :resize_to_fit => [1200, 900]
  end

  # 980+
  version :regular do
    process :resize_to_fit => [900, 675]    
  end

  # 480 - 979
  version :tablet do
    process :resize_to_fit => [675, 500]
  end

  # 480 - 
  version :mobile do
    process :resize_to_fit => [400, 300]    
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
     %w(jpg jpeg gif png)
  end

end