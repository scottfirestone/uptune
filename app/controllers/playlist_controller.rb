class PlaylistController < ApplicationController
  def create
    playlist = PlaylistCreator.new(current_user)
    redirect_to playlist_path(playlist.id) 
  end

  def show

  end
end
