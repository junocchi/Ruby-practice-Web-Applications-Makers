require 'spec_helper'
require 'rack/test'
require_relative '../../app'

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  context "GET /albums/new" do
    it 'returns a form to add a new album' do
      response = get('/albums/new')
  
      expect(response.status).to eq(200)
      # Assert we have the correct form tag with the action and method.
      expect(response.body).to include('<h1>Add a new album</h1>')
      expect(response.body).to include('<form method="POST" action="/albums">')
      expect(response.body).to include('<input type="text" name="title" />')
      expect(response.body).to include('<input type="text" name="release_year" />')
      expect(response.body).to include('<input type="text" name="artist_id" />')
      # We can assert more things, like having
      # the right HTML form inputs, etc.
    end
  end

  context "GET /artists/new" do
    it 'returns a form to add a new artist' do
      response = get('/artists/new')
  
      expect(response.status).to eq(200)
      # Assert we have the correct form tag with the action and method.
      expect(response.body).to include('<h1>Add a new artist</h1>')
      expect(response.body).to include('<form method="POST" action="/artists">')
      expect(response.body).to include('<input type="text" name="name" />')
      expect(response.body).to include('<input type="text" name="genre" />')
    end
  end
  
  context "POST /posts" do
    xit 'returns a success page' do
      # We're now sending a POST request,
      # simulating the behaviour that the HTML form would have.
      response = post(
        '/posts',
        title: 'Welcome',
        content: 'I am a post'
      )
  
      expect(response.status).to eq(200)
      expect(response.body).to include('<p>Your post has been added!</p>')
    end
  
    it 'responds with 400 status if parameters are invalid' do
      # ...
    end
  end

  context 'GET /artists' do
    it 'should return name and genre of all artists' do
      response = get('/artists')
      expect(response.status).to eq(200)
      # then we include the most important part of our HTML code, to test it
      expect(response.body).to include('Pixies')
      expect(response.body).to include('Nina Simone')
    
    end

    it 'should return a link to all artists' do
      response = get('/artists')
      expect(response.status).to eq(200)
      
      expect(response.body).to include('href="/artists/2"')
      expect(response.body).to include('href="/artists/3"')
    end 
  end

  context 'GET /albums' do
    it 'should return the title of all albums' do
      response = get('/albums')
      expect(response.status).to eq(200)
        # then we include the most important part of our HTML code, to test it
      expect(response.body).to include('Surfer Rosa')
      expect(response.body).to include('Ring Ring')

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
    it 'should validate album parameters' do
      response = post(
        '/albums', 
        invalid_artist_title: 'OK Computer', 
        another_invalid_thing: 123, 
      )

      expect(response.status).to eq(400)
      # error for when the client adds wrong content
    end

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
