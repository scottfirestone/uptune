require "rails_helper"

RSpec.describe SpotifyService, type: :service do
  it "creates a playlist" do
    VCR.use_cassette('create a playlist') do
      service = SpotifyService.new
      user = create_authorized_user
      name = Time.now.strftime('%Y%m%d')

      response = service.create_playlist(user, name)

      # expect(response).to 
    end
  end
end
