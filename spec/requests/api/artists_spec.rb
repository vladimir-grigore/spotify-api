require 'rails_helper'

RSpec.describe "Api::Artists", type: :request do
  describe "GET /index" do
    let(:artist_name) { 'ABBA' }
    let(:request) { get "/api/artists/#{artist_name}" }

    before do
      allow(RSpotify::Artist).to receive(:search).with(artist_name)
    end

    it 'calls the Spotify API with the artist name as a param' do
      request

      expect(RSpotify::Artist).to have_received(:search).with(artist_name)
    end
  end
end
