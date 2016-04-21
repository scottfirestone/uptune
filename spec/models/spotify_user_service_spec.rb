require "rails_helper"

RSpec.describe SpotifyUserService, type: :service do
  it "creates a playlist" do
    VCR.use_cassette('create a playlist') do
      user = create_authorized_user
      service = SpotifyUserService.new(user)
      name = Time.now.strftime('%Y%m%d')

      response = service.create_playlist(user, name)

      # expect(response).to
    end
  end
end
