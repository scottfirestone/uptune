require "rails_helper"

RSpec.describe CodeGenerator, type: :model do
  it "generates a code from library" do
    code = CodeGenerator.generate_code

    expect(code).to be_between(10000, 1000000)
  end

  it "removes the generated code from the library" do
    library_count = CodeGenerator.code_library.count

    generated_code = CodeGenerator.generate_code
    new_library_count = CodeGenerator.code_library.count
    code_library = CodeGenerator.class_variable_get(:@@code_library)

    expect(new_library_count).to eq(library_count-1)
    code_library.each do |code|
      expect(generated_code).to_not eq(code)
    end
  end
end
