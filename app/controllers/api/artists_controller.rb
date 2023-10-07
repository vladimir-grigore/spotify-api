class Api::ArtistsController < ApplicationController
  def show
    result = RSpotify::Artist.search(params[:id])
    render json: result
  end
end
