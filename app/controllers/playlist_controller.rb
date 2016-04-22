class PlaylistController < ApplicationController
  def create
    playlist = PlaylistCreator.create_playlist(current_user)
    redirect_to playlist_path(playlist.code)
  end

  def show
    @playlist = Playlist.find_by(code: params[:id])
    render file: "public/404" if @playlist.nil?
  end
end
