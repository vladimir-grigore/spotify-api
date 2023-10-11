# frozen_string_literal: true

module Api
  class ArtistsController < ApplicationController
    def show
      response = retrieve_artists_service(artist_params[:id]).call
      render json: response, status: :ok
    rescue StandardError => e
      raise e
    end

    private

    def artist_params
      params.permit(:id)
    end

    def retrieve_artists_service(name)
      RetrieveArtistsService.new(artist_name: name)
    end
  end
end
