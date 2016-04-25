module CodeGenerator
  require "securerandom"

  def self.generate_playlist_code
    SecureRandom.hex(3)
  end

  def self.generate_user_token
    SecureRandom.uuid
  end
end
