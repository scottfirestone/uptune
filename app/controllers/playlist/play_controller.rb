class Playlist::PlayController < ApplicationController
  def show
    @playlist = Playlist.find_by(code: params[:code])
  end
end
