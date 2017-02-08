require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module CAPlatform
  class Application < Rails::Application
    config.generators do |g|
      g.test_framework :rspec, fixture: true
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
      g.view_specs false
      g.helper_specs false
      g.stylesheets = false
      g.javascripts = false
      g.helper = false
    end

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        # to be decided later
        origins 'localhost:8000', 'localhost:4200'
        resource '*', headers: :any, methods: [:post, :options, :put]
      end
    end

  end
end
