require "rails_helper"

RSpec.feature "User who adds track cannot upvote it", type: :feature, js: true do
  scenario "the vote count does not increment" do
    VCR.use_cassette("add_track_to_playlist") do
      user     = create_authenticated_user
      playlist = PlaylistCreator.create_playlist(user)
      track    = create(:track)

      visit playlist_path(playlist.code)
      fill_in "query", with: "stairway"
      click_button("Search")
      wait_for_ajax

      click_on("Add", :match => :first)

      within("#playlist-track-1") do
        expect(page).to have_content("1")
      end
    end
  end
end
