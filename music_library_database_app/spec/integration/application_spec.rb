require 'spec_helper'
require 'rack/test'
require_relative '../../app'

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  context 'GET /artists' do
    it 'should return name and genre of all artists' do
      response = get('/artists')
      expect(response.status).to eq(200)
      # then we include the most important part of our HTML code, to test it
      expect(response.body).to include('Pixies')
      expect(response.body).to include('Rock')
      
      expect(response.body).to include('Nina Simone')
      expect(response.body).to include('Pop')
    end

    it 'should return a link to all artists' do
      response = get('/artists')
      expect(response.status).to eq(200)
      
      expect(response.body).to include('href="/artists/2"')
      expect(response.body).to include('href="/artists/3"')
    end 
  end

  context 'GET /albums' do
    it 'should return title and release year of all albums' do
      response = get('/albums')
      expect(response.status).to eq(200)
        # then we include the most important part of our HTML code, to test it
      expect(response.body).to include('Surfer Rosa')
      expect(response.body).to include('Released: 1988')
      
      expect(response.body).to include('Ring Ring')
      expect(response.body).to include('Released: 1973')
    end  

    it 'should return a link to all albums' do
      response = get('/albums')
      expect(response.status).to eq(200)
      
      expect(response.body).to include('href="/albums/2"')
      expect(response.body).to include('href="/albums/12"')
    end  
  end

  context 'GET /artists/:id' do
    it 'should return info about specific artist' do
      response = get('/artists/2')
      expect(response.status).to eq(200)
      # then we include the most important part of our HTML code, to test it
      expect(response.body).to include('<h1>ABBA</h1>')
      expect(response.body).to include('Genre: Pop')
    end  
  end

  context 'GET /albums/:id' do
    it 'should return info about specific album' do
      response = get('/albums/2')
      expect(response.status).to eq(200)
      # then we include the most important part of our HTML code, to test it
      expect(response.body).to include('<h1>Surfer Rosa</h1>')
      expect(response.body).to include('Release year: 1988')
      expect(response.body).to include('Artist: Pixies')
    end  
  end

  context 'POST /albums' do
    it 'should create a new album' do
      response = post(
        '/albums', 
        title: 'Midnights', 
        release_year: '2022', 
        artist_id: '3'
      )
      # post request /albums, given some parameters. 
      # The album data is correct, but it is just for our test, 
      # so it doesn't matter much.

      expect(response.status).to eq(200)
      expect(response.body).to eq('') # returns nothing

      # Then we check if it is returning the new album too
      response = get('/albums')
      expect(response.body).to include('Midnights')
    end  
  end

  context 'POST /artists' do
    it 'should create a new artist' do
      response = post(
        '/artists', 
        name: 'Wild nothing', 
        genre: 'Indie',
      )

      expect(response.status).to eq(200)
      expect(response.body).to eq('')

      response = get('/artists')
      expect(response.body).to include('Wild nothing')
    end 
  end
end
