require "rails_helper"

RSpec.describe User, type: :model do
  it { should have_many(:playlists) }

  it "knows if its token is expired" do
    user = create(:user)
    user.update_attributes(token_expiry: (Time.now + 1.hour))
    expect(user.token_expired?).to eq(false)
  end

  it "can update an expired token" do
    user = create(:user)
    user.update_attributes(token_expiry: (Time.now - 1.hour))

    expect(user.token_expired?).to eq(true)

    new_token = "mock token"
    user.update_token(new_token)

    expect(user.token).to eq(new_token)
    expect(user.token_expired?).to eq(false)
  end
end
