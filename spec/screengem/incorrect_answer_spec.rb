require "screengem_spec_helper"

module Screengem
  RSpec.describe IncorrectAnswer do
    let(:question) { Support::ScreengemFixture.question_1.new }

    subject(:incorrect_answer) { Screengem::IncorrectAnswer.new(question) }

    it "extracts question text" do
      expect { raise incorrect_answer }.to raise_error(Screengem::IncorrectAnswer, "Question one?")
    end
  end
end
