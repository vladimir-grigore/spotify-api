# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::Artists', type: :request do
  describe 'GET /index' do
    let(:artist_name) { 'ABBA' }
    let(:request) { get "/api/artists/#{artist_name}" }
    let(:api_response) { [RSpotify::Artist.new, RSpotify::Artist.new] }

    before do
      allow(RSpotify::Artist).to receive(:search).with(artist_name).and_return(api_response)
    end

    it 'calls the Spotify API with the artist name as a param' do
      request

      expect(RSpotify::Artist).to have_received(:search).with(artist_name)
      expect(JSON.parse(response.body).length).to eq(2)
      expect(JSON.parse(response.body).first.keys).to eq(%w[id group label images])
    end
  end
end
