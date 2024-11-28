if Rails.env.production?
  url = Rails.application.config_for(:cable)['url']
elsif Rails.env.development?
  url = 'redis://redis:6379'
end
Sidekiq.configure_server do |config|
  config.redis = { url: url }
end
Sidekiq.configure_client do |config|
  config.redis = { url: url }
end
