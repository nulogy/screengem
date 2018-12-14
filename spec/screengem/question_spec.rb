require "screengem_spec_helper"

module Screengem
  RSpec.describe Question do
    let(:actor) { double("Actor") } # rubocop:disable RSpec/VerifiedDoubles
    let(:question) { Support::ScreengemFixture.question_1.new }
    let(:configured_question) { question.configure(actor) }

    it "calling answer calls execute on question" do
      expect(configured_question).to receive(:execute).and_call_original

      configured_question.answer
    end

    it "implements two phase initialization" do
      expect(question).to have_attributes(actor: nil)
      expect(configured_question).to have_attributes(actor: be(actor))
    end

    it "all questions support dampening unless overridden with skip_dampening" do
      expect(Support::ScreengemFixture.question_supports_dampening.supports_dampening?).to be(true)
      expect(Support::ScreengemFixture.question_skips_dampening.supports_dampening?).to be(false)
    end

    it "warns subclasses to implement the execute method" do
      base = Screengem::Question.new

      expect { base.execute }.to raise_error(RuntimeError, /You must define an execute method/)
    end
  end
end
