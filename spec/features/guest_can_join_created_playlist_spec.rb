require "rails_helper"

RSpec.feature "Guest can join created playlist" do
  scenario "they see the playlist page for that playlist" do
      playlist = create(:playlist)
      playlist.update(code: "xyz")

      visit "/playlist/xyz"

      expect(current_path).to eq(playlist_path(playlist.code))
      expect(page).to have_content("Search Spotify")
      within(".playlist-code") do
        expect(page).to have_content("Your Playlist Code is: #{playlist.code}")
    end
  end
end
