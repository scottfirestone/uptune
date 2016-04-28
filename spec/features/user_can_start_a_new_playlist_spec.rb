require "rails_helper"

RSpec.feature "Creating a playlist" do
  scenario "user can create a new playlist" do
    VCR.use_cassette("create_a_playlist") do
      user = create_authenticated_user
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit root_path
      within('.navbar') do
        click_on "Start an UpTune Playlist"
      end

      playlist = Playlist.last

      expect(current_path).to eq(playlist_path(playlist.code))
      expect(page).to have_content("Search Spotify")
      within(".playlist-code") do
        expect(page).to have_content("Invite others to vote at: http://www.example.com/playlist/#{playlist.code}")
      end
    end
  end
end
