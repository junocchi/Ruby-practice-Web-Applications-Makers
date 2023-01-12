require 'spec_helper'
require 'rack/test'
require_relative '../../app'

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  context 'GET /albums' do
    it 'should return the list of albums' do
      response = get('/albums')
      
      expected_response = 'Surfer Rosa, Waterloo, Super Trouper, Bossanova, Lover, Folklore, I Put a Spell on You, Baltimore, Here Comes the Sun, Fodder on My Wings, Ring Ring'
      
      expect(response.status).to eq(200)
      expect(response.body).to eq(expected_response)
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
      # The album data is correct, but it is just for our test, so it doesn't matter much.

      expect(response.status).to eq(200)
      expect(response.body).to eq('') # returns nothing

      # Then we check if it is returning the new album too
      response = get('/albums')
      expect(response.body).to include('Midnights')
    end  
  end
end
