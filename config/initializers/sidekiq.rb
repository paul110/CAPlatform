unless Rails.env.test?
  redis = YAML.load_file(Rails.root.join('config', 'sidekiq_redis.yml'))[Rails.env]
  namespace = "sidekiq:cap:#{Rails.env}"

  Sidekiq.configure_server do |config|
    config.redis = { url: "redis://#{redis}/12", namespace: namespace }
  end

  Sidekiq.configure_client do |config|
    config.redis = { url: "redis://#{redis}/12", namespace: namespace }
  end
end
