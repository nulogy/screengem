module Screengem
  RSpec.describe ScreenElements do
    Module.new do
      # Does not override the visit_path method
      ExampleOne = Class.new(Screengem::ScreenElement)

      # Does override the visit_path method
      ExampleTwo = Class.new(Screengem::ScreenElement) do
        def visit_path
          "some/path"
        end
      end
    end

    subject(:screen) { Screengem::ScreenElements.instance }

    it "creates screen element methods" do
      generated_creation_methods = screen.public_methods(false)

      expect(generated_creation_methods).to contain_exactly(:example_one, :example_two)
    end

    it "wraps as expected" do
      expect(screen.example_one).to be_a_kind_of(Screengem::ScreenElement)
      expect(screen.example_two).to be_a_kind_of(Screengem::AutomaticVisit)
    end
  end
end
