require 'sinatra'
require 'sinatra/base'
require 'sinatra/namespace'
require 'sequel'
require 'sequel/extensions/seed'

require 'pg'

require 'json'
require 'multi_json'
#подтягивание всех файлов из перечисленных папок-сборка
%w{controllers models routes}.each{|dir|Dir.glob("./#{dir}/*.rb",&method(:require))}
# Sequel ORM для работой с БД
DB = Sequel.connect(
  adapter: :postgres,
  database: 'sinatra_di_dev',
  host: 'localhost',
  password: 'password',
  user: 'sinatra_di',
  max_connections: 10,
)

Sequel::Seed.setup :development
Sequel.extension :seed
Sequel::Seeder.apply(DB, './seeds')
#module DiModule
#    class App < Sinatra::Base
#        register Sinatra::Namespace

#        namespace '/api/v1' do
            get '/' do
                redirect to('/hello/Dilya')
            end
#        end

        get '/hello/:name' do |n|
            "Sinatra Di приветствует тебя, #{n}!"
        end

        get %r{/hello/([\w]+)} do |c|
             "Hello, #{c}!"
        end

        get '/*' do
            "I dont know what is the #{params[:splat]}.Its was your typed!"
        end
#       Необязательные параметры в шаблонах маршрутов
        get '/jobs.?:format?' do
          # соответствует "GET /jobs", "GET /jobs.json", "GET /jobs.xml" и т.д.
          "Да, работает этот маршрут!"
        end

#    end
#end
