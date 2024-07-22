CarrierWave.configure do |config|
  config.storage = :fog

  config.fog_credentials = {
      provider: 'AWS', # required
      aws_access_key_id: ENV['DO_SPACE_ACCESS_KEY'], # required
      aws_secret_access_key: ENV['DO_SPACE_SECRET_KEY'], # required
      region: 'sfo2', # required
      endpoint: 'https://sfo2.digitaloceanspaces.com' # required
  }

  config.fog_directory = ENV['DO_SPACE_DIRECTORY'] # required
  # config.fog_public = false # optional, defaults to true
  config.asset_host = ENV['DO_SPACE_CDN_URL']
  config.fog_attributes = { 'Cache-Control' => 'max-age=315576000' } # optional, defaults to {}
end
