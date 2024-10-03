module Screengem
  RSpec.describe Configurable do
    let(:actor) { Class.new { include Actor }.new }
    let(:screen) { instance_double(ScreenElements) }

    subject(:configurable) { Support::ScreengemFixture.task_3.new }

    it "adds configurability" do
      configured = configurable.configure(actor, screen)

      expect(configured).to be_a(Configurable).and have_attributes(actor:, screen:)
    end
  end
end
