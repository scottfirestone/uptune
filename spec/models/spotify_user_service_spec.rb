require "rails_helper"

RSpec.describe SpotifyUserService, type: :service do
  it "creates a playlist" do
    VCR.use_cassette('create a playlist') do

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

  it "adds a track to an existing playlist" do
    user = create_authenticated_user
    service = SpotifyUserService.new(user)

    response = service.add_track_to_playlist(playlist_id, track_uri)

    expect()
  end
end
