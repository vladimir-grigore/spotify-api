require 'rails_helper'

RSpec.describe "Api::Albums", type: :request do
  describe "GET /index" do
    let(:album_name) { 'Californication' }
    let(:request) { get "/api/albums/#{album_name}" }

    before do
      allow(RSpotify::Album).to receive(:search).with(album_name)
    end

    it 'calls the Spotify API with the album name as a param' do
      request

      expect(RSpotify::Album).to have_received(:search).with(album_name)
    end
  end
end
