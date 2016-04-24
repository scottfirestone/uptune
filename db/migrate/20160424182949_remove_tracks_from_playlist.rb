class RemoveTracksFromPlaylist < ActiveRecord::Migration
  def change
    remove_column :playlists, :tracks
  end
end
