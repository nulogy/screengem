module Screengem
  RSpec.describe Dampenable do
    describe "question" do
      it "that skips dampening" do
        question_class = Support::ScreengemFixture.question_skips_dampening

        expect(question_class).to_not be_supports_dampening
      end

      it "that does not skip dampening" do
        question_class = Support::ScreengemFixture.question_supports_dampening

        expect(question_class).to be_supports_dampening
      end
    end

    describe "task" do
      it "that skips dampening" do
        task_class = Support::ScreengemFixture.task_skips_dampening

        expect(task_class).to_not be_supports_dampening
      end

      it "that does not skip dampening" do
        task_class = Support::ScreengemFixture.task_supports_dampening

        expect(task_class).to be_supports_dampening
      end

      it "that with custom dampening" do
        task_class = Support::ScreengemFixture.task_supports_dampen_for

        expect(task_class).to be_supports_dampening.and have_attributes(seconds_to_dampen: 3)
      end
    end
  end
end
