# spec/spec_helper.rb
require 'rack/test'
require 'rspec'
require 'factory_bot'
require 'faker'
require 'database_cleaner'

ENV['RACK_ENV'] = 'test'

require_relative '../boot'

ActiveRecord::Migration.check_pending!


module RSpecMixin
  include Rack::Test::Methods
end


RSpec.configure do |config|
  config.include RSpecMixin
  config.include FactoryBot::Syntax::Methods

  config.before(:suite) do
    FactoryBot.find_definitions
  end

  config.before(:suite) do
    DatabaseCleaner.clean_with :truncation
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
