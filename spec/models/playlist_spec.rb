require 'rails_helper'

RSpec.describe Playlist, type: :model do
  it { should belong_to(:user) }
  it { should have_many(:tracks) }
  it { should have_many(:playlist_tracks) }
  it { should validate_uniqueness_of(:code) }

  it "should format its created at" do
    playlist = create(:playlist)
    playlist.update(created_at: "2016-04-28 16:44:23.557601000 +0000")

    expect(playlist.created_at).to eq(Time.parse("2016-04-28 16:44:23.557601000 +0000"))
    expect(playlist.created_at_formatted).to eq("04/28/2016 at 04:44PM")
  end
end
