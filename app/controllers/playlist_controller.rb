class PlaylistController < ApplicationController
  def create
    playlist = PlaylistCreator.create_playlist(current_user)
    redirect_to playlist_path(playlist.code)
  end

  def show

  end
end
