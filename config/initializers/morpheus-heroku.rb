MorpheusHeroku.configure do |config|
  config.app_name = "caplatform"

  # config.backup_location = "tmp/latest.dump"

  # By default, we use ActiveRecord::Base.connection_config[:database]
  # config.database_name = "database_development"

  # Show debugging events
  config.log_events = true

  # Your development email. Will not scramble emails containing this string
  # config.dev_email = "dev@blah.com"
end
