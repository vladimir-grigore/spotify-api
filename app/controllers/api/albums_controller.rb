class Api::AlbumsController < ApplicationController
  def show
    result = RSpotify::Album.search(params[:id])
    render json: result
  end
end
