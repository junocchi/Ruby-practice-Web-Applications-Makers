# file: app.rb
require 'sinatra'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/album_repository'
require_relative 'lib/artist_repository'

DatabaseConnection.connect

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/album_repository'
    also_reload 'lib/artist_repository'
  end

  get '/albums' do
    repo = AlbumRepository.new
    albums = repo.all

    response = albums.map do |album|
      album.title
    end.join(', ')

    return response
  end

  # demo W4 - 3.1
  get '/albums/:id' do # this is a path parameter and 
    # Sinatra will get whatever value is given in the path to replace
    # the dynamic placeholder :id
    repo = AlbumRepository.new
    artist_repo = ArtistRepository.new

    # p params[:id]
    # we use the find method to get the id from the branch
    @album = repo.find(params[:id]) # we set album as an instance variable
    # so it can be used in our .erb file, where we will add the HTML info
    @artist = artist_repo.find(@album.artist_id) # it gets the info from the above param

    return erb(:album) # this will connect to your .erb file, in views
  end

  post '/albums' do
    repo = AlbumRepository.new
    new_album = Album.new
    new_album.title = params[:title]
    new_album.release_year = params[:release_year]
    new_album.artist_id = params[:artist_id]
    
    repo.create(new_album)
    
    return ''
  end

  get '/artists' do
    repo = ArtistRepository.new
    artists = repo.all

    response = artists.map do |artist|
      artist.name
    end.join(', ')

    return response
  end

  post '/artists' do
    repo = ArtistRepository.new
    new_artist = artist.new
    new_artist.name = params[:name]
    new_artist.genre = params[:genre]
    
    repo.create(new_artist)
    return ''
  end
end