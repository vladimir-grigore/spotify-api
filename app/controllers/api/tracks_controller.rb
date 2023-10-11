# frozen_string_literal: true

module Api
  class TracksController < ApplicationController
    def show
      results = retrieve_tracks_service(tracks_params[:id]).call
      render json: results, status: :ok
    rescue StandardError => e
      raise e
    end

    private

    def tracks_params
      params.permit(:id)
    end

    def retrieve_tracks_service(id)
      RetrieveTracksService.new(album_id: id)
    end
  end
end
