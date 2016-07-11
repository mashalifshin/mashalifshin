# config/initializers/cors.rb
Rails.application.config.middleware.insert_before 0, 'Rack::Cors' do
  allow do
    origins ENV['CLOUDFRONT_DISTRIBUTION_DOMAIN']

    resource '/assets/*',
      headers: :any,
      methods: [:get]

    resource '/uploads/*',
      headers: :any,
      methods: [:get]
  end
end