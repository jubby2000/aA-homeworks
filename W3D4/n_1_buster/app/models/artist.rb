class Artist < ApplicationRecord
  has_many :albums,
    class_name: 'Album',
    foreign_key: :artist_id,
    primary_key: :id

  def n_plus_one_tracks
    albums = self.albums
    tracks_count = {}
    albums.each do |album|
      tracks_count[album.title] = album.tracks.length
    end

    tracks_count
  end

  def better_tracks_query
    albums = self.albums.joins(:tracks)
    .select('albums.*, COUNT(*) AS tracks_count')
    .where('albums.artist_id = ?', 1)
    .group('albums.id')

    counts = Hash.new(0)
    albums.each do |album|
      counts[album.title] = album.tracks_count
    end
    counts
  end
end
