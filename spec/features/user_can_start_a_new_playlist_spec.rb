require "rails_helper"

RSpec.feature "Creating a playlist" do
  scenario "user can create a new playlist" do
    VCR.use_cassette("create_playlist") do
      user = create_authorized_user
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit root_path
      click_on "Start an UpTune Playlist"

      playlist = Playlist.last

      expect(current_path).to eq(playlist_path(playlist.id))
      expect(page).to have_content("Search Spotify")
      within(".playlist-code") do
        expect(page).to have_content("Your Playlist Code is: #{playlist.code}")
      end
    end
  end
end
