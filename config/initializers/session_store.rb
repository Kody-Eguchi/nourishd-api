# Rails.application.config.session_store :cookie_store, key: '_nutrition_app_api_session', domain: :all, tld_length: 2
Rails.application.config.session_store :cookie_store, key: '_nutrition_app_api_session', domain: :all, same_site: :none, secure: Rails.env.production?
puts "🚨🚨🚨Session store loaded with SameSite=#{Rails.application.config.session_options[:same_site]}🚨🚨🚨"