require 'sinatra'
require './lib/tasks/db'

namespace :db do
  task :environment do
    require 'sequel'
    ENV['DATABASE_URL'] ||= 'postgres://sinatra_di:password@localhost/sinatra_seq'
    ENV['RACK_ENV'] ||= 'development'
    ENV['DATABASE'] = 'sinatra_di_dev' if ENV['RACK_ENV'] == 'development'
    ENV['DATABASE'] = 'sinatra_di_test' if ENV['RACK_ENV'] == 'test'
    ENV['DATABASE'] = 'sinatra_di_prod' if ENV['RACK_ENV'] == 'production'
  end
end
