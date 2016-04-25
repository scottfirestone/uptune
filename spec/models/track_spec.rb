require "rails_helper"

RSpec.describe Track, type: :model do
  it { should validate_uniqueness_of(:uri) }
end
