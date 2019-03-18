module Screengem
  RSpec.describe Question do
    let(:actor) { Class.new { include Actor }.new }
    let(:screen) { instance_double(ScreenElements) }
    let(:question) { Support::ScreengemFixture.question_1.new }
    let(:configured_question) { question.configure(actor, screen) }

    it_behaves_like "configurable"
    it_behaves_like "executable"

    it "calling answer calls execute on question" do
      expect(configured_question).to receive(:execute).and_call_original

      configured_question.answer
    end

    it "all questions support dampening unless overridden with skip_dampening" do
      expect(Support::ScreengemFixture.question_supports_dampening).to be_supports_dampening
      expect(Support::ScreengemFixture.question_skips_dampening).to_not be_supports_dampening
    end
  end
end
