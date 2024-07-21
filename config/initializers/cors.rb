# config/initializers/cors.rb
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'https://mashalifshin.sfo2.digitaloceanspaces.com'

    resource '/assets/*',
      headers: :any,
      methods: [:get]

    resource '/mashalifshin/*',
      headers: :any,
      methods: [:get]
  end
end
