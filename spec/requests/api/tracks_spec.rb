require 'rails_helper'

RSpec.describe "Api::Tracks", type: :request do
  describe "GET /index" do
    let(:track_name) { 'Metropolis' }
    let(:request) { get "/api/tracks/#{track_name}" }

    before do
      allow(RSpotify::Track).to receive(:search).with(track_name)
    end

    it 'calls the Spotify API with the track name as a param' do
      request

      expect(RSpotify::Track).to have_received(:search).with(track_name)
    end
  end
end
