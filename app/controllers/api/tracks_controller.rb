class Api::TracksController < ApplicationController
  def show
    results = retrieve_tracks_service(tracks_params[:id]).call
    render json: results, status: :ok
  rescue => e
    raise e
  end

  private

  private

  def tracks_params
    params.permit(:id)
  end

  def retrieve_tracks_service(id)
    RetrieveTracksService.new(album_id: id)
  end

end
