# file: spec/integration/application_spec.rb

require "spec_helper"
require "rack/test" 
require_relative '../../app' 
describe Application do

  include Rack::Test::Methods
  
  let(:app) { Application.new }

# Challenge
  context 'POST /sort-names' do
    it 'returns 200 OK with a list of names in order' do

      response = post('/sort-names?names=Joe,Alice,Zoe,Julia,Kieran')

      expect(response.status).to eq(200)
      expect(response.body).to eq('Alice,Joe,Julia,Kieran,Zoe')
    end
  end

  # Exercise
  # context 'GET /names' do
    # it 'returns 200 OK with the right content' do
    #   response = get('/names?names=Julia, Mary, Karim')

    #   expect(response.status).to eq(200)
    #   expect(response.body).to eq('Julia, Mary, Karim')
    # end
end  