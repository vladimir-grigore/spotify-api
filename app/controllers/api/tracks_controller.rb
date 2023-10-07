class Api::TracksController < ApplicationController
  def show
    result = RSpotify::Track.search(params[:id])
    render json: result
  end
end
