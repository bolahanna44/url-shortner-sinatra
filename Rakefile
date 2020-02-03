require "sinatra/activerecord/rake"

namespace :db do
  task :load_config do
    require_relative 'config/application'
  end
end


desc 'start the application in port 4567'
task :server do
  sh 'rackup -p 4567'
end

task default: :server

desc 'Open an irb session preloaded with the environment'
task :console do
  require_relative 'boot'
  require 'rubygems'
  require 'pry'

  Pry.start
end
