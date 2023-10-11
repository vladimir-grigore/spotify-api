class RetrieveAlbumsService
  attr_reader :artist_id

  def initialize(artist_id:)
    @artist_id = artist_id
  end

  def call
    artist = RSpotify::Artist.find(artist_id)

    artist&.albums.map do |album|
      {
        id: album.id,
        name: album.name,
        images: album.images
      }
    end
  end
end
