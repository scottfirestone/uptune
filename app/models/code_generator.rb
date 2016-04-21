module CodeGenerator
  require "securerandom"

  def self.generate_code
    SecureRandom.hex(3)
  end
end
