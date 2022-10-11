module Screengem
  RSpec.describe ScreenElements do
    # rubocop:disable RSpec/LeakyConstantDeclaration
    Module.new do
      # Does not override the visit_path method
      ScreenElementExampleOne = Class.new(Screengem::ScreenElement)

      # Does override the visit_path method
      ScreenElementExampleTwo = Class.new(Screengem::ScreenElement) do
        def visit_path
          "some/path"
        end
      end
    end
    # rubocop:enable RSpec/LeakyConstantDeclaration

    subject(:screen) { Screengem::ScreenElements.instance }

    it "creates screen element methods" do
      generated_creation_methods = screen.public_methods(false)

      expect(generated_creation_methods).to contain_exactly(:screen_element_example_one, :screen_element_example_two)
    end

    it "wraps as expected" do
      expect(screen.screen_element_example_one).to be_a(Screengem::ScreenElement)
      expect(screen.screen_element_example_two).to be_a(Screengem::AutomaticVisit)
    end
  end
end
