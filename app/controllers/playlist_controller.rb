class PlaylistController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :issue_token, only: [:show]

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
    track = Track.where(uri: params[:track][:uri]).first_or_create(track_params(params))
    playlist_track = PlaylistTrack.new(playlist_id: playlist.id, track_id: track.id)
    if playlist_track.save
      playlist_track.votes.create(token: session[:token])
      redirect_to playlist_path(playlist.code)
    else
      flash[:danger] = "That song is already on the playlist"
      redirect_to playlist_path(playlist)
    end
  end

  def upvote_track
    playlist_track = PlaylistTrack.find(params[:playlist_track_id])
    playlist_track.votes.create(token: session[:token])
    redirect_to :back
  end

  def complete
    playlist = Playlist.find_by(code: params[:code])
    playlist_completer = PlaylistCompleter.new(playlist)
    redirect_to playlist_play_path(playlist.code)
  end

  private

    def track_params(params)
      { uri: params[:track][:uri], artist: params[:track][:artist], title: params[:track][:title] }
    end

    def issue_token
      session[:token] ||= CodeGenerator.generate_user_token
    end
end
