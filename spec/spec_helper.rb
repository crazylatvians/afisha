# ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'capybara/rspec'
require 'capybara/rails'
require 'database_cleaner'

DatabaseCleaner.strategy  = :truncation
Capybara.default_selector = :css

RSpec.configure do |config|
  config.mock_with :rspec
  config.infer_base_class_for_anonymous_controllers = false
  config.include FactoryGirl::Syntax::Methods
  # config.include Devise::TestHelpers, type: :helper
  # config.include Devise::TestHelpers, type: :controller

  config.after(:each) { DatabaseCleaner.clean }
end
