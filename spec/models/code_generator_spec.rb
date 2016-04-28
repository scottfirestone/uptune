require "rails_helper"

RSpec.describe CodeGenerator, type: :model do
  it "generates a unique playlist code from library" do
    code_1 = CodeGenerator.generate_playlist_code
    code_2 = CodeGenerator.generate_playlist_code

    expect(code_1).to_not eq(code_2)
  end

  it "generates a unique user token from library" do
    token_1 = CodeGenerator.generate_user_token
    token_2 = CodeGenerator.generate_user_token

    expect(token_1).to_not eq(token_2)
  end
end
