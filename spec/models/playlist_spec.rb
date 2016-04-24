require 'rails_helper'

RSpec.describe Playlist, type: :model do
  it "can add a track" do
    track_params = { uri:   "spotify:track:51pQ7vY7WXzxskwloaeqyj",
                              artist: "Led Zeppelin",
                              title: "Stairway To Heaven"
                   }
    playlist = create(:playlist)
    playlist.add_track(track_params)

    expect(playlist.tracks.count).to eq(1)
    expect(playlist.tracks.first.uri).to eq("spotify:track:51pQ7vY7WXzxskwloaeqyj")
  end
end
