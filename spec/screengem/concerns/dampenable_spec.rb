require "screengem_spec_helper"

module Screengem
  RSpec.describe Dampenable do
    describe "question" do
      it "that skips dampening" do
        question_class = Support::ScreengemFixture.question_skips_dampening

        expect(question_class.supports_dampening?).to be(false)
      end

      it "that does not skip dampening" do
        question_class = Support::ScreengemFixture.question_supports_dampening

        expect(question_class.supports_dampening?).to be(true)
      end
    end

    describe "task" do
      it "that skips dampening" do
        task_class = Support::ScreengemFixture.task_skips_dampening

        expect(task_class.supports_dampening?).to be(false)
      end

      it "that does not skip dampening" do
        task_class = Support::ScreengemFixture.task_supports_dampening

        expect(task_class.supports_dampening?).to be(true)
      end
    end
  end
end
