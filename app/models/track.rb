class Track < ActiveRecord::Base
  has_many :playlist_tracks
  has_many :playlists, through: :playlist_tracks

  def self.votes
    self.playlist_tracks.votes
  end
end
