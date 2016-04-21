FactoryGirl.define do
  factory :playlist do
    name "MyString"
    id "MyString"
    uri "MyString"
    href "MyString"
    tracks "MyString"
    snapshot_id "MyString"
    user 1
  end
  factory :user do
    uid "MyString"
    image "MyString"
    token "MyString"
    refresh_token "MyString"
    token_expiry Time.parse("2016-04-20 22:21:52.000000")
  end
end
