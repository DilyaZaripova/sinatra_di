#require './sinatra_di'
#run Sinatra::Application

root = File.expand_path File.dirname(__FILE__)
require File.join(root, 'sinatradi.rb')

#app = Rack::Builder.app do
#  run DiModule::App
#end

#run app
#вместо закоммиченного пускового модуля
run Sinatra::Application