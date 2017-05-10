#require './sinatra_di'
#run Sinatra::Application

root = File.expand_path File.dirname(__FILE__)
require File.join(root, 'sinatra_di.rb')

app = Rack::Builder.app do
  run DiModule::App
end

run app