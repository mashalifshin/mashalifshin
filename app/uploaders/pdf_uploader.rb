class PdfUploader < MashaLifshinUploader

  # White list of extensions which are allowed to be uploaded.
  def extension_white_list
    %w(pdf)
  end

end
