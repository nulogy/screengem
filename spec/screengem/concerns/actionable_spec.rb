require "screengem_spec_helper"

module Screengem
  RSpec.describe Actionable do
    subject(:task) { Support::ScreengemFixture.task_1.new }

    it "chooses browser factory" do
      Screengem.configuration.browser_actions = true

      action_factory = task.action

      expect(action_factory).to be(Screengem::Factories::BrowserActionFactory.instance)
    end

    it "chooses standard factory" do
      Screengem.configuration.browser_actions = false

      action_factory = task.action

      expect(action_factory).to be(Screengem::Factories::StandardActionFactory.instance)
    end
  end
end
