class Vote < ActiveRecord::Base
  belongs_to :playlist_track

  validates_uniqueness_of :token, { scope: :playlist_track_id }
end
