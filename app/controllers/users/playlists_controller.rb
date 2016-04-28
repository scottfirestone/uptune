class Users::PlaylistsController < ApplicationController
  before_action :require_current_user

  def index
    @playlists = current_user.playlists
  end

  private

    def require_current_user
      render file: "public/404" unless current_user
    end
end
