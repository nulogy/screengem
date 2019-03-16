module Screengem
  module Factories
    RSpec.describe QuestionFactory do
      subject(:question_factory) { described_class.instance }

      before do
        Screengem.configure do |config|
          config.question_scope = "Support::ScreengemFixture::Questions"
        end
      end

      it "creates question" do
        question = question_factory.question_one

        expect(question).to be_a_kind_of(Support::ScreengemFixture.question_1)
      end

      it "creates error question for unknown questions" do
        question = question_factory.unknown

        expect(question).to be_a_kind_of(QuestionFactory::QuestionError)
        expect { question.execute }.to raise_error(
          Screengem::ScreengemError, /Unable to create question: 'UnknownQuestion'/
        )
      end
    end
  end
end
