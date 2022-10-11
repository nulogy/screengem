module Screengem
  RSpec.describe Dampenable do
    describe "question" do
      it "that does not skip dampening" do
        question_class = Support::ScreengemFixture.question_supports_dampening

        expect(question_class).to be_supports_dampening
      end
    end

    describe "task" do
      it "that does not skip dampening" do
        task_class = Support::ScreengemFixture.task_supports_dampening

        expect(task_class).to be_supports_dampening
      end
    end
  end
end
