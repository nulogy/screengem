require "screengem_spec_helper"

module Screengem
  RSpec.describe DSL do
    subject(:step_definition) { Class.new.include(described_class).new }

    it "makes the question factory available" do
      question_factory = step_definition.question

      expect(question_factory).to be(Screengem::Factories::QuestionFactory.instance)
    end

    it "makes the task factory available" do
      task_factory = step_definition.task

      expect(task_factory).to be(Screengem::Factories::TaskFactory.instance)
    end
  end
end
