# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::Albums', type: :request do
  describe 'GET /index' do
    let(:artist) { RSpotify::Artist.new }
    let(:artist_id) { '0LcJLqbBmaGUft1e9Mm8HV' }
    let(:request) { get "/api/albums/#{artist_id}" }
    let(:api_response) { [RSpotify::Album.new, RSpotify::Album.new] }

    before do
      allow(RSpotify::Artist).to receive(:find).with(artist_id).and_return(artist)
      allow(artist).to receive(:albums).and_return(api_response)
    end

    it 'calls the Spotify API with the album name as a param' do
      request

      expect(RSpotify::Artist).to have_received(:find).with(artist_id)
      expect(JSON.parse(response.body).length).to eq(2)
      expect(JSON.parse(response.body).first.keys).to eq(%w[id name images])
    end
  end
end
