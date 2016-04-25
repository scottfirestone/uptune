class PlaylistController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    playlist = PlaylistCreator.create_playlist(current_user)
    redirect_to playlist_path(playlist.code)
  end

  def show
    @playlist = Playlist.find_by(code: params[:id])
    render file: "public/404" if @playlist.nil?
  end

  def add_track
    playlist = Playlist.find_by(code: params[:track][:code])
    playlist.add_track(track_params(params))
    redirect_to playlist_path(playlist.code)
  end

  private

    def track_params(params)
      { uri: params[:track][:uri], artist: params[:track][:artist], title: params[:track][:title] }
    end
end
