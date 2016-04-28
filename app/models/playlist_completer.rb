class PlaylistCompleter

  def initialize(playlist)
    new_snapshot_id = retrieve_new_snapshot_id(playlist)
    playlist.update(snapshot_id: new_snapshot_id)
  end

  def retrieve_new_snapshot_id(playlist)
    SpotifyUserService.new(playlist.user).update_user_playlist(playlist)
  end

end
