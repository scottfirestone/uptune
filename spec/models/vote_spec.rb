require "rails_helper"

RSpec.describe Vote, type: :model do
  it { should validate_uniqueness_of(:token).scoped_to(:playlist_track_id) }
end
