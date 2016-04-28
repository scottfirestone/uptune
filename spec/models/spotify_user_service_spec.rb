require "rails_helper"
require "base64"

RSpec.describe SpotifyUserService, type: :service do
  it "creates a playlist" do
    VCR.use_cassette('create_a_playlist') do

      user = create_authenticated_user
      service = SpotifyUserService.new(user)
      name = Time.now.strftime('%Y%m%d')

      response = service.create_playlist(name)

      expected_keys = [:collaborative,
                       :description,
                       :external_urls,
                       :followers,
                       :href,
                       :id,
                       :images,
                       :name,
                       :owner,
                       :public,
                       :snapshot_id,
                       :tracks,
                       :type,
                       :uri
                      ]

      expect(response.keys).to eq(expected_keys)
      expect(response[:owner][:id]).to eq(user.uid)
    end
  end
  it "requests a new user token" do
    VCR.use_cassette("refresh_user_token") do
      user = create_authenticated_user
      old_user_token = user.token

      hash = { grant_type: "refresh_token", refresh_token: user.refresh_token}
      encoded_auth = Base64.strict_encode64("#{ENV["SPOTIFY_CLIENT_ID"]}:#{ENV["SPOTIFY_CLIENT_SECRET"]}")
      service = SpotifyUserService.new(user)
      service.request_new_token

      new_user_token = user.token

      expect(old_user_token).to_not eq(new_user_token)
    end
  end
end
