module Screengem
  RSpec.describe Configurable do
    let(:actor) { Class.new { include Actor }.new }
    let(:screen) { instance_double(ScreenElements) }

    subject(:configurable) { Support::ScreengemFixture.task_3.new }

    it "adds configurability" do
      configured = configurable.configure(actor, screen)

      expect(configured).to be_a_kind_of(Configurable).and have_attributes(actor: actor, screen: screen)
    end
  end
end
