require "screengem_spec_helper"

module Screengem
  RSpec.describe PageReferences do
    Module.new do
      class ExamplePage < Screengem::FeaturePage
        def menu_item_names
          ["Sites", "Users"]
        end
      end
    end

    let(:primitive_class) { Screengem::Task }

    it "creates page reference methods" do
      primitive = primitive_class.new

      primitive.extend(Screengem::PageReferences)

      expect(primitive.example_page).to have_attributes(
        menu_item_names: contain_exactly("Sites", "Users")
      )
    end
  end
end
