module Screengem
  RSpec.describe Configuration do
    it "has sensible defaults" do
      Screengem.configure

      expect(Configuration.new).to have_attributes(
        apply_dampening: false,
        dampen_configuration_root: "default",
        question_scope: "Questions",
        task_scope: "Tasks"
      )
    end

    it "is configurable" do
      Screengem.configure do |config|
        config.apply_dampening = false
        config.question_scope = "MyProject::Questions"
        config.task_scope = "MyProject::Tasks"
        config.dampen_configuration_filename = "some_filename"
        config.dampen_configuration_root = "debug"
      end

      expect(Screengem.configuration).to have_attributes(
        apply_dampening: false,
        question_scope: "MyProject::Questions",
        task_scope: "MyProject::Tasks",
        dampen_configuration_filename: "some_filename",
        dampen_configuration_root: "debug",
        dampen_configuration_sample_filename: "some_filename.sample"
      )
    end
  end
end
