class CodeGenerator
  @@code_library = (10000..1000000).to_a

  def self.generate_code
    @@code_library.shuffle!.pop
  end

  def self.code_library
    @@code_library
  end
end
