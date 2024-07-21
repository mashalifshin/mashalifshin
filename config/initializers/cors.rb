# config/initializers/cors.rb
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'localhost:3000', \
            '127.0.0.1:3000', \
            'mashalifshin.onrender.com', \
            'mashalifshin.com', \
            'https://mashalifshin.sfo2.digitaloceanspaces.com'

    resource '/assets/*',
      headers: :any,
      methods: [:get]

    resource '/mashalifshin/*',
      headers: :any,
      methods: [:get]
  end
end
