source 'https://rubygems.org'

# CORE
gem 'rails', '~> 5.0.1'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'sidekiq', '~> 4.2.2'
gem 'redis-namespace'
gem 'rack-cors', require: 'rack/cors'
gem 'sprockets', '~> 4.0.0.beta4'
gem 'sprockets-commoner'


#ASSETS
gem 'turbolinks', '~> 5'

# API
gem 'redis', '~> 3.0'
gem 'active_model_serializers', '~> 0.10.0'

# DEPLOYMENT
gem 'morpheus-heroku', '0.2.3'
gem 'capistrano-rails'
gem 'capistrano', '3.4.1'
gem 'capistrano-bower'

# MISC
gem 'aws-sdk', '~> 2.3.0'
gem 'rails_12factor', group: :production

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'rspec-rails', '~> 3.5'
  gem 'spring-commands-rspec'
  gem 'webmock', require: false
  gem 'pry-rails'
  gem 'pry-remote'
  gem 'factory_girl_rails'
  gem 'ffaker'
end

group :development do
  gem 'annotate'
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'better_errors'
end


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
