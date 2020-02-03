# frozen_string_literal: true

require 'sinatra'
require 'active_record'

# pull in the models
Dir[File.join(__dir__, 'models', '*.rb')].each { |file| require file }

# pull in config
require_relative './config/application'

# pull in the app
require File.join(File.dirname(__FILE__), 'app.rb')
