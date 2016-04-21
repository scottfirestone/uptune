require "rails_helper"

RSpec.feature "User logs out" do
  scenario "they no longer see their user info" do
    stub_omniauth

    visit root_path
    click_on "Login with Spotify"

    within(".navbar") do
      expect(page).to have_content("mock_user")
      expect(page).to have_content("UpTune")
      expect(page).to have_content("Start an UpTune Playlist")
      expect(page).to have_content("Logout")
      expect(page).to_not have_content("Login with Spotify")
    end

    click_on "Logout"

    within(".navbar") do
      expect(page).to have_content("Login with Spotify")
      expect(page).to_not have_content("mock_user")
    end
  end
end
