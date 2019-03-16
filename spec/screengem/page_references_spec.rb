require "screengem_spec_helper"

module Screengem
  RSpec.describe PageReferences do
    Module.new do
      ExamplePage = Class.new(Screengem::FeaturePage)
      ExampleSection = Class.new(Screengem::FeaturePage)
    end

    it "creates page reference methods" do
      generated_creation_methods = Screengem::PageReferences.instance.public_methods(false)

      expect(generated_creation_methods).to contain_exactly(:example_page, :example_section)
    end
  end
end
