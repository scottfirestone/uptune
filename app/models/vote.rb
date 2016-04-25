class Vote < ActiveRecord::Base
  belongs_to :playlist_track

  validates_uniqueness_token, { scope: :playlist_track }
end
