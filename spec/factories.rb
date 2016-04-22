FactoryGirl.define do
  factory :playlist do
    name        "MyString"
    playlist_id "MyString"
    id          "MyString"
    uri         "MyString"
    href        "MyString"
    tracks      "MyString"
    snapshot_id "MyString"
    code        "MyString"
  end
  factory :user do
    uid           "MyString"
    image         "MyString"
    token         "MyString"
    refresh_token "MyString"
    token_expiry  Time.parse("2016-04-20 22:21:52.000000")
  end
end

FactoryGirl.define do
  factory :user_with_playlist do
    uid           "MyString"
    image         "MyString"
    token         "MyString"
    refresh_token "MyString"
    token_expiry  Time.parse("2016-04-20 22:21:52.000000")

    after (:build) do |playlist|
      user.playlists << FactoryGirl.create(:playlist, user: user)
    end
  end
end
