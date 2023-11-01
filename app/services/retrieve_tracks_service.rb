# frozen_string_literal: true

class RetrieveTracksService
  attr_reader :album_id

  def initialize(album_id:)
    @album_id = album_id
  end

  def call
    album = RSpotify::Album.find(album_id)

    album&.tracks&.map do |track|
      {
        id: track.id,
        group: 'track',
        label: track.name
      }
    end
  end
end
