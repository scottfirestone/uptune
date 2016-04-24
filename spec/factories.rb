FactoryGirl.define do
  factory :playlist do
    name "20160424"
    playlist_id "6hTUSjCRCxJ5rwVQtFLnKw"
    id          "MyString"
    uri "spotify:user:mingus_amongus:playlist:6hTUSjCRCxJ5rwVQtFLnKw"
    href "https://api.spotify.com/v1/users/mingus_amongus"
    snapshot_id "V/LIB06PqBKBcd49oYDhJVqjKdowJXm53xJLvcPz1vhj/12XI2Q6/yNjNbn6oWGP"
    code "4203a7"
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
  factory :playlist_track do
    playlist nil
    track nil
  end
  factory :track do
    artist "MyString"
    title "MyString"
    uri "MyString"
  end
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
