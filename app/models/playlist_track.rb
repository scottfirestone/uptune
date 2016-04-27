class PlaylistTrack < ActiveRecord::Base
  belongs_to :playlist
  belongs_to :track
  has_many :votes

  validates_uniqueness_of :track_id, { scope: :playlist_id }

  def vote_count
    votes.count
  end

  def self.reorder_tracks_by_votes
    joins(:votes)
      .group("playlist_tracks.id")
      .order("votes.count DESC")
  end
end
