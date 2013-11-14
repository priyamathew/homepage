ENV['RACK_ENV'] = 'test'
require File.join(File.dirname(__FILE__), '..', 'app')
require 'dm-rspec'
require 'capybara/rspec'
require 'database_cleaner'

def app; App; end

Capybara.app = App
Capybara.javascript_driver = :webkit

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.include DataMapper::Matchers

  config.before(:suite) do
    DataMapper.auto_migrate!
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with :truncation
  end

  config.before :each, :js => true do
    DatabaseCleaner.strategy = :truncation
  end

  config.before :each do
    DatabaseCleaner.start
  end

  config.after :each do
    DatabaseCleaner.clean
  end
end
