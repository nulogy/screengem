require "screengem_spec_helper"

module Screengem
  RSpec.describe Configurable do
    let(:actor) { double("Actor") } # rubocop:disable RSpec/VerifiedDoubles

    subject(:configurable) { Support::ScreengemFixture.task_3.new }

    it "adds configurability" do
      configured = configurable.configure(actor)

      expect(configured).to be(configurable).and have_attributes(actor: actor)
    end
  end
end
