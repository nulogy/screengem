module Screengem
  RSpec.describe ScreenElements do
    Module.new do
      ExamplePage = Class.new(Screengem::ScreenElement)
      ExampleSection = Class.new(Screengem::ScreenElement)
    end

    it "creates screen element methods" do
      generated_creation_methods = Screengem::ScreenElements.instance.public_methods(false)

      expect(generated_creation_methods).to contain_exactly(:example_page, :example_section)
    end
  end
end
