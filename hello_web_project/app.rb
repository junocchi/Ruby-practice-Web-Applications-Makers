require 'sinatra/base'
require 'sinatra/reloader'

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

# Challenge
# # Request:
# POST http://localhost:9292/sort-names
# # With body parameters:
# names=Joe,Alice,Zoe,Julia,Kieran
# # Expected response (sorted list of names):
# Alice,Joe,Julia,Kieran,Zoe

  # challenge
  post '/sort-names' do

    names = params[:names]
    # => Joe,Alice,Zoe,Julia,Kieran
    return names.split(',').sort.join(',')
    # => Alice,Joe,Julia,Kieran,Zoe
  end

# Exercise
#   Use the Design recipe to test-drive the following route:
# # Request:
# GET /names
# # Expected response (2OO OK):
# Julia, Mary, Karim

  # get '/names' do
  #   names = params[:names]
  #   return "#{names}"
  # end
end
