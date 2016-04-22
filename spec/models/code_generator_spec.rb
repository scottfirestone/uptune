require "rails_helper"

RSpec.describe CodeGenerator, type: :model do
  it "generates a code from library" do
    code_1 = CodeGenerator.generate_code
    code_2 = CodeGenerator.generate_code

    expect(code_1).to_not eq(code_2)
  end
end
