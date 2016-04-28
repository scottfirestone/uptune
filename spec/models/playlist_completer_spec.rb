require "rails_helper"

RSpec.describe PlaylistCompleter, type: :model do
  it "updates the playlist snapshot id" do
    VCR.use_cassette "complete_playlist" do
      user = create_authenticated_user
      playlist = PlaylistCreator.create_playlist(user)
      old_playlist_snapshot_id = playlist.snapshot_id

      playlist_completer = PlaylistCompleter.new(playlist)
      new_playlist_snapshot_id = playlist.snapshot_id

      expect(new_playlist_snapshot_id).to_not eq(old_playlist_snapshot_id)
    end
  end
end
