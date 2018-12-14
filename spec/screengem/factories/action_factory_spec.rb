require "screengem_spec_helper"

module Screengem
  module Factories
    RSpec.describe ActionFactory do
      before do
        Screengem.configure do |config|
          config.action_scope = "Support::ScreengemFixture::Actions"
        end
      end

      it "creates action" do
        action_factory = BrowserActionFactory.instance

        action = action_factory.action_one

        expect(action).to be_a_kind_of(Support::ScreengemFixture.browser_action_1)
      end

      it "creates error action for unknown actions" do
        action_factory = StandardActionFactory.instance

        action = action_factory.unknown

        expect(action).to be_a_kind_of(ActionFactory::ActionError)
        expect { action.execute }.to raise_error(Screengem::ScreengemError, /Unable to create action: 'UnknownAction'/)
      end
    end
  end
end
