# frozen_string_literal: true

require "sinatra/activerecord"


ENV['RACK_ENV'] ||= 'development'


# This is some boilerplate code to read the config/database.yml file
# And connect to the database
# config_path = File.join(__dir__, 'database.yml')
# ActiveRecord::Base.establish_connection(YAML.load_file(config_path)[ENV['RACK_ENV']])
#
# if ENV['RACK_ENV'] == 'development'
#   # Set a logger so that you can view the SQL actually performed by ActiveRecord
#   logger = Logger.new(STDOUT)
#   logger.formatter = proc do |severity, datetime, progname, msg|
#     "#{msg}\n"
#   end
#
#   ActiveRecord::Base.logger = logger
# end

