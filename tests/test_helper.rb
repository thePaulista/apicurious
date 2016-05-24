ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
#require 'mocha/setup'
require 'capybara/rails'
require 'database_cleaner'

class ActionDispatch::IntegrationTest
  include Capybara::DSL
  DatabaseCleaner.strategy = :transaction
  DatabaseCleaner.clean_with(:truncation)

  def setup
    DatabaseCleaner.start
  end
  def teardown
    reset_session!
    DatabaseCleaner.clean
  end
end
