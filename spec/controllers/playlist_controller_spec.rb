require "rails_helper"

RSpec.describe PlaylistController, :type => :controller do
  describe "POST add_track" do
    it "can add a track to the playlist" do
      VCR.use_cassette("add_track_to_playlist") do
        user = create_authenticated_user
        playlist = PlaylistCreator.create_playlist(user)

        post :add_track, track: { playlist_id: playlist.code,
                                  uri:   "spotify:track:51pQ7vY7WXzxskwloaeqyj",
                                  artist: "Led Zeppelin",
                                  title: "Stairway To Heaven"
                                }

        expect(Playlist.last.tracks.count).to eq(1)
        expect(Playlist.last.tracks.last.uri).to eq("spotify:track:51pQ7vY7WXzxskwloaeqyj")
        expect(Playlist.last.tracks.last.artist).to eq("Led Zeppelin")
        expect(Playlist.last.tracks.last.title).to eq("Stairway To Heaven")
        expect(response).to redirect_to(playlist_path(playlist.code))
      end
    end
  end
end
