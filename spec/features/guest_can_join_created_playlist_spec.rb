require "rails_helper"

RSpec.feature "Guest can join created playlist" do
  scenario "they see the playlist page for that playlist" do
    playlist = create(:playlist)
    playlist.update(code: "xyz")

    visit "/playlist/xyz"

    expect(current_path).to eq(playlist_path(playlist.code))
    expect(page).to have_content("Search Spotify")
    within(".playlist-code") do
      expect(page).to have_content("Invite others to vote at: http://www.example.com/playlist/xyz")
    end
  end

  scenario "they see a 404 if trying a playlist not created" do
    visit "/playlist/foobar"

    expect(page).to have_content("404")
    expect(page).to_not have_content("Your Playlist Code is: foobar")
  end
end
