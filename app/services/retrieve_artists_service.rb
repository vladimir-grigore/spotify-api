# frozen_string_literal: true

class RetrieveArtistsService
  attr_reader :artist_name

  def initialize(artist_name:)
    @artist_name = artist_name
  end

  def call
    results = RSpotify::Artist.search(artist_name)

    results.map do |artist|
      {
        id: artist.id,
        group: 'artist',
        label: artist.name,
        images: artist.images
      }
    end
  end
end
