require "rails_helper"

RSpec.describe PlaylistController, :type => :controller do
  describe "POST add_track" do
    it "can add a track to the playlist" do
      VCR.use_cassette("add_track_to_playlist") do
        user = create_authenticated_user
        playlist = PlaylistCreator.create_playlist(user)

        post :add_track, track: { code: playlist.code,
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

  describe "POST create" do
    it "creates a new playlist" do
      VCR.use_cassette("create_fresh_playlist") do
        user = create_authenticated_user
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        post :create
        playlist_code = Playlist.last.code

        expect(response).to redirect_to(playlist_path(playlist_code))
      end
    end
  end

  describe "GET show" do
    it "shows the current upvote playlist" do
      VCR.use_cassette("create_a_playlist") do
        user = create_authenticated_user
        playlist = PlaylistCreator.create_playlist(user)

        get :show, { id: playlist.code }
        expect(response).to render_template(:show)
      end
    end
  end

  describe "GET complete" do
    it "renders the playlist play view" do
      VCR.use_cassette("complete_playlist") do
        user = create_authenticated_user
        playlist = PlaylistCreator.create_playlist(user)

        get :complete, { code: playlist.code }
        expect(response).to redirect_to(playlist_play_path(playlist.code))
      end
    end
  end
end
