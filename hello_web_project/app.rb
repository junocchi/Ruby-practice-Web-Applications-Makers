require 'sinatra/base'
require 'sinatra/reloader'

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    name = params[:name]
  return "Hello #{name}!"
  end

  post '/hello' do
    name = params[:name]
  return "Hello #{name}!"
  # The text content above (string) is sent as a request body
  end

  post '/submit' do
    name = params[:name]
    message = params[:message]
  return "Thanks #{name}, you sent this message: #{message}!"
  # The text content above (string) is sent as a request body
  end
end