# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors

# Rails.application.config.middleware.insert_before 0, Rack::Cors do
#   allow do
#     origins 'example.com'
#
#     resource '*',
#       headers: :any,
#       methods: [:get, :post, :put, :patch, :delete, :options, :head]
#   end
# end
require 'dotenv'

port = ENV['PORT']

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "localhost:#{port}"
    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head],
      credentials: true
  end
  allow do
    origins "nourishd.netlify.app"
    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head],
      credentials: true
      # expose: ['Access-Control-Allow-Origin']
  end
end

Rails.application.config.session_store :cookie_store, key: '_nutrition_app_api_session', domain: :all, tld_length: 2, same_site: :none, secure: true