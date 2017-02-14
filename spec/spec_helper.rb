# frozen_string_literal: true
# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
require 'simplecov'

SimpleCov.start do
  add_filter '/config/'
  add_filter '/spec/'
  add_filter '/test/'
  add_group 'Models', 'app/models'
  add_group 'Controllers', 'app/controllers'
  add_group 'Reports', 'app/uploaders'
  add_group 'Serializers', 'app/serializers'
  add_group 'Helpers', 'app/helpers'
  add_group 'Mailers', 'app/mailers'
  add_group 'Lib', 'lib/'
end

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  Kernel.srand config.seed
  config.order = :random

  config.profile_examples = 5

  if config.files_to_run.one?
    config.default_formatter = 'doc'
  end
end

def json_response
  JSON.parse(response.body)
end
