require "rails_helper"

RSpec.feature "User searches and adds track to playlist", :js => true do
  scenario "they see the search result" do
    VCR.use_cassette("search_for_tracks", :record => :new_episodes) do
      user = create_authenticated_user
      playlist = PlaylistCreator.create_playlist(user)

      visit playlist_path(playlist.code)
      fill_in "query", with: "Stairway"
      click_button("Search")
      sleep 2
      within("#search-results") do
        expect(page).to have_content("Stairway")
        expect(page).to have_content("Led Zeppelin")
      end
    end
  end
  scenario "they see the added song" do
    VCR.use_cassette("add_track_to_playlist", :record => :new_episodes) do
      user = create_authenticated_user
      playlist = PlaylistCreator.create_playlist(user)

      visit playlist_path(playlist.code)
      fill_in "query", with: "Stairway"
      click_button("Search")
      sleep 2
      first(".current-result .add-link").click

      expect(current_path).to eq(playlist_path(playlist.code))
      within(".playlist") do
        expect(page).to have_content("1")
        expect(page).to have_content("Stairway")
        expect(page).to have_content("Led Zeppelin")
      end
    end
  end
end
