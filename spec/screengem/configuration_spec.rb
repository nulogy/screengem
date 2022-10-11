module Screengem
  RSpec.describe Configuration do
    it "has sensible defaults" do
      Screengem.configure

      expect(Configuration.new).to have_attributes(
        question_scope: "Questions",
        task_scope: "Tasks"
      )
    end

    it "is configurable" do
      Screengem.configure do |config|
        config.question_scope = "MyProject::Questions"
        config.task_scope = "MyProject::Tasks"
      end

      expect(Screengem.configuration).to have_attributes(
        question_scope: "MyProject::Questions",
        task_scope: "MyProject::Tasks"
      )
    end
  end
end
