require "screengem_spec_helper"

module Screengem
  RSpec.describe Action do
    let(:actor) { Class.new { include Actor }.new }
    let(:screen) { double("Screen") } # rubocop:disable RSpec/VerifiedDoubles
    let(:action) { Support::ScreengemFixture.action_1.new }
    let(:configured_action) { action.configure(actor, screen) }

    it "implements two phase initialization" do
      expect(action).to have_attributes(actor: nil)
      expect(configured_action).to have_attributes(actor: actor, screen: screen)
    end

    it "warns subclasses to implement the execute method" do
      base = Screengem::Action.new

      expect { base.execute }.to raise_error(RuntimeError, /You must define an execute method/)
    end
  end
end
