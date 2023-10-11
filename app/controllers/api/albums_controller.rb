class Api::AlbumsController < ApplicationController
  def show
    results = retrieve_albums_service(albums_params[:id]).call
    render json: results, status: :ok
  rescue => e
    raise e
  end

  private

  def albums_params
    params.permit(:id)
  end

  def retrieve_albums_service(id)
    RetrieveAlbumsService.new(artist_id: id)
  end
end
