CarrierWave.configure do |config|
  config.root             = Rails.root.join('tmp')
  config.cache_dir        = 'uploads'

  config.permissions = 0666
  config.directory_permissions = 0777

  config.storage          =  :file
end
