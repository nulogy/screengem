module Screengem
  RSpec.describe Configurable do
    let(:actor) { Class.new { include Actor }.new }
    let(:screen) { double("Screen") } # rubocop:disable RSpec/VerifiedDoubles

    subject(:configurable) { Support::ScreengemFixture.task_3.new }

    it "adds configurability" do
      configured = configurable.configure(actor, screen)

      expect(configured).to be(configurable).and have_attributes(actor: actor, screen: screen)
    end
  end
end
