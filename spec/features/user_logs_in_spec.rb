require "rails_helper"

RSpec.feature "Spotify Oauth" do
  scenario "user logs in with spotify" do
    visit root_path

    within(".navbar") do
      expect(page).to have_content("Login with Spotify")
      expect(page).to have_content("UpTune")
      expect(page).to have_content("Start an UpTune Playlist")
      expect(page).to_not have_content("mingus_amongus")
    end

    click_on "Login with Spotify"

    within(".navbar") do
      expect(page).to have_content("mingus_amongus")
      expect(page).to have_content("UpTune")
      expect(page).to have_content("Start an UpTune Playlist")
      expect(page).to_not have_content("Login with Spotify")
    end
  end
end
