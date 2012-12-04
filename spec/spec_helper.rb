require 'spork'

Spork.prefork do
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'capybara/rspec'
  require 'capybara/rails'
  require 'database_cleaner'

  DatabaseCleaner.strategy  = :truncation
  Capybara.default_selector = :css

  counter = -1
  RSpec.configure do |config|
    config.mock_with :rspec
    config.infer_base_class_for_anonymous_controllers = false
    config.include FactoryGirl::Syntax::Methods
    config.include Devise::TestHelpers, type: :helper
    config.include Devise::TestHelpers, type: :controller

    config.after(:each) do
      DatabaseCleaner.clean

      counter += 1
      if counter > 9
        GC.enable
        GC.start
        GC.disable
        counter = 0
      end
    end

    config.after(:suite) { counter = 0 }
  end

end

Spork.each_run do
  GC.disable
  load "#{Rails.root}/config/routes.rb"
  Dir["#{Rails.root}/app/**/*.rb"].each { |f| load f }
  Dir["#{Rails.root}/lib/*.rb"].each { |f| load f }
end
