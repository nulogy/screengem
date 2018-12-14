require "screengem_spec_helper"

module Screengem
  RSpec.describe Configuration do
    it "has sensible defaults" do
      expect(Configuration.new).to have_attributes(
        apply_dampening: false,
        browser_actions: false,
        dampen_configuration_root: "default",
        action_scope: "Actions",
        question_scope: "Questions",
        task_scope: "Tasks"
      )
    end

    it "is configurable" do
      Screengem.configure do |config|
        config.apply_dampening = false
        config.browser_actions = true
        config.action_scope = "MyProject::Actions"
        config.question_scope = "MyProject::Questions"
        config.task_scope = "MyProject::Tasks"
        config.dampen_configuration_filename = "some_filename"
        config.dampen_configuration_root = "debug"
      end

      expect(Screengem.configuration).to have_attributes(
        apply_dampening: false,
        browser_actions: true,
        action_scope: "MyProject::Actions",
        question_scope: "MyProject::Questions",
        task_scope: "MyProject::Tasks",
        dampen_configuration_filename: "some_filename",
        dampen_configuration_root: "debug",
        dampen_configuration_sample_filename: "some_filename.sample"
      )
    end
  end
end
