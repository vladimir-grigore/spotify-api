require 'rails_helper'

RSpec.describe "Api::Tracks", type: :request do
  describe "GET /index" do
    let(:album) { RSpotify::Album.new }
    let(:album_id) { '0uUtGVj0y9FjfKful7cABY' }
    let(:request) { get "/api/tracks/#{album_id}" }
    let(:api_response) { [RSpotify::Track.new, RSpotify::Track.new] }

    before do
      allow(RSpotify::Album).to receive(:find).with(album_id).and_return(album)
      allow(album).to receive(:tracks).and_return(api_response)
    end

    it 'calls the Spotify API with the track name as a param' do
      request

      expect(RSpotify::Album).to have_received(:find).with(album_id)
      expect(JSON.parse(response.body).length).to eq(2)
      expect(JSON.parse(response.body).first.keys).to eq(["id", "name"])
    end
  end
end
