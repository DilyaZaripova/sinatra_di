require 'sinatra'

require 'sinatra/namespace'

require 'sinatra/base'

module DiModule
    class App < Sinatra::Base
        register Sinatra::Namespace

        namespace '/api/v1' do
            get '/' do
                redirect to('/hello/Dilya')
            end
        end

        get '/hello/:name' do |n|
            "Sinatra Di приветствует тебя, #{n}!"
        end

        get %r{/hello/([\w]+)} do |c|
             "Hello, #{c}!"
        end

        get '/*' do
            "I dont know what is the #{params[:splat]}.Its was your typed!"
        end

    end
end