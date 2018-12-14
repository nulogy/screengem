require "screengem_spec_helper"

module Screengem
  RSpec.describe Actor do
    let(:action_1) { Support::ScreengemFixture.action_1.new }
    let(:action_2) { Support::ScreengemFixture.action_2.new }
    let(:action_3) { Support::ScreengemFixture.action_3.new }

    let(:question_1) { Support::ScreengemFixture.question_1.new }
    let(:question_2) { Support::ScreengemFixture.question_2.new }
    let(:question_3) { Support::ScreengemFixture.question_3.new }

    let(:task_1) { Support::ScreengemFixture.task_1.new }
    let(:task_2) { Support::ScreengemFixture.task_2.new }
    let(:task_3) { Support::ScreengemFixture.task_3.new }

    subject(:actor) do
      Class.new do
        include Screengem::Actor
      end.new
    end

    describe "asks" do
      it "a single question" do
        expect(question_1).to receive(:configure).and_call_original
        expect(question_1).to receive(:execute).and_call_original

        actor.asks(question_1)
      end

      it "multiple questions" do
        [question_1, question_2, question_3].each do |question| # rubocop:disable RSpec/IteratedExpectation
          expect(question).to receive(:configure).and_call_original
          expect(question).to receive(:execute).and_call_original
        end

        actor.asks(question_1, question_2, question_3)
      end

      it "stops asking after first incorrect answer" do
        expect(question_1).to receive(:configure).and_call_original
        expect(question_1).to receive(:execute).and_return(false)

        expect(question_2).to_not receive(:execute)

        expect { actor.asks(question_1, question_2) }
          .to raise_error(IncorrectAnswer, "Question one?")
      end
    end

    describe "performs" do
      it "a single task" do
        expect(task_1).to receive(:execute)

        actor.performs(task_1)
      end

      it "multiple tasks" do
        [task_1, task_2, task_3].each do |task| # rubocop:disable RSpec/IteratedExpectation
          expect(task).to receive(:configure).and_call_original
          expect(task).to receive(:execute).and_call_original
        end

        actor.performs(task_1, task_2, task_3)
      end
    end

    describe "takes" do
      it "a single action" do
        expect(action_1).to receive(:execute)

        actor.takes_action(action_1)
      end

      it "multiple actions" do
        [action_1, action_2, action_3].each do |action| # rubocop:disable RSpec/IteratedExpectation
          expect(action).to receive(:configure).and_call_original
          expect(action).to receive(:execute).and_call_original
        end

        actor.takes_action(action_1, action_2, action_3)
      end
    end

    describe "has the ability to" do
      it "recall using symbols or strings" do
        actor.remember(company_name: "PackPlus")

        expect(actor.recall(:company_name)).to eq("PackPlus")
        expect(actor.recall("company_name")).to eq("PackPlus")
      end

      it "remember multiple values" do
        actor.remember(sheet_id: 3, company_name: "PackPlus")

        expect(actor.recall(:sheet_id)).to eq(3)
        expect(actor.recall(:company_name)).to eq("PackPlus")
      end
    end
  end
end
