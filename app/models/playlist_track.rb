class PlaylistTrack < ActiveRecord::Base
  belongs_to :playlist
  belongs_to :track
  has_many :votes

  validates_uniqueness_of :track_id, { scope: :playlist_id }

  def vote_count
    votes.count
  end
end
