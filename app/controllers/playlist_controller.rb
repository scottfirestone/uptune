class PlaylistController < ApplicationController
  def create
    PlaylistCreator.new(current_user)
  end

  def show

  end
end
