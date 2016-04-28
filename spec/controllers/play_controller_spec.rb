require "rails_helper"

RSpec.describe Playlist::PlayController, type: :controller do
  describe "GET show" do
    it "can show the spotify play button for playlist" do
      VCR.use_cassette("add_track_to_playlist") do
        user = create_authenticated_user
        playlist = PlaylistCreator.create_playlist(user)

        get :show, { code: playlist.code }

        expect(response).to render_template(:show)
      end
    end
  end
end
