require 'rubygems'
require 'fog-aws'

# With credit to https://gist.github.com/listenrightmeow/3278894
namespace :assets do
  desc 'Upload assets to Digital Ocean space'
  task :upload => :environment do
    # create a connection
    storage = Fog::Storage.new({
      :provider                 => 'AWS',
      :region                   => ENV['DO_SPACE_REGION'],
      :aws_access_key_id        => ENV['DO_SPACE_ACCESS_KEY'],
      :aws_secret_access_key    => ENV['DO_SPACE_SECRET_KEY'],
      :endpoint                 => ENV['DO_SPACE_CDN_URL']
    })

    do_assets_dir = storage.directories.get('mashalifshin', prefix: 'assets')

    assets = build_asset_dir
    upload_assets assets, do_assets_dir

  end
end

def build_asset_dir
  Dir.chdir("#{Rails.root}/public") do
    FileList['assets', 'assets/**/*'].inject({}) do |hash, path|
      if File.directory? path
        hash.update("#{path}/" => :directory)
      else
        hash.update(path => OpenSSL::Digest::MD5.hexdigest(File.read(path)))
      end
    end
  end
end

def upload_assets assets, do_directory
  assets.each do |file, etag|
    case etag
    when :directory
      puts "Directory - #{file}"
      do_directory.files.create(key: file, public: true)
    else
      puts "Uploading - #{file}"
      do_directory.files.create(key: file, public: true, body: File.open("#{Rails.root}/public/#{file}"), cache_control: "max-age=#{6.month.to_i}, public", expires: "#{6.month.from_now.httpdate}")
    end
  end
end
