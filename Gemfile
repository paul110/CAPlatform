source 'https://rubygems.org'

ruby '2.4.0'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# CORE
gem 'rails', '~> 5.0.1'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'sidekiq', '~> 4.2.2'
gem 'redis-namespace'
gem 'rack-cors', require: 'rack/cors'
gem 'draftsman', '~> 0.6.0'

# API
gem 'active_model_serializers', '~> 0.10.0'

# ASSETS
gem 'turbolinks', '~> 5'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'


# DEPLOYMENT
gem 'morpheus-heroku', '0.2.3'
gem 'capistrano-rails'
gem 'capistrano', '3.4.1'
gem 'capistrano-bower'

# MISC
gem 'faraday', '~> 0.11.0'
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
  gem 'simplecov', require: false
end

group :development do
  gem 'annotate'
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'better_errors'
  gem 'awesome_print'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
