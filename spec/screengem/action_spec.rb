module Screengem
  RSpec.describe Action do
    let(:actor) { Class.new { include Actor }.new }
    let(:screen) { instance_double(PageReferences) }
    let(:action) { Support::ScreengemFixture.action_1.new }
    let(:configured_action) { action.configure(actor, screen) }

    it "warns subclasses to implement the execute method" do
      base = Screengem::Action.new

      expect { base.execute }.to raise_error(RuntimeError, /You must define an execute method/)
    end
  end
end
