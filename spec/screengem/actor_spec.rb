module Screengem
  RSpec.describe Actor do
    let(:question_1) { Support::ScreengemFixture.question_1.new }
    let(:question_2) { Support::ScreengemFixture.question_2.new }
    let(:question_3) { Support::ScreengemFixture.question_3.new }

    let(:task_1) { Support::ScreengemFixture.task_1.new }
    let(:task_2) { Support::ScreengemFixture.task_2.new }
    let(:task_3) { Support::ScreengemFixture.task_3.new }

    subject(:actor) do
      Class.new do
        include Screengem::Actor

        def name
          "Stephen King"
        end
      end.new
    end

    before { ActorMemory.instance.clear }

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

      it "displays a message when the tag cannot be recalled" do
        actor.remember(book: "It", state: "Maine")

        expect { actor.recall(:movie) }.to raise_error(
          RuntimeError, /Stephen King does not recall movie\nStephen King recalls: book and state/
        )
      end

      context "when recalling models" do
        let(:model) { double }

        it "perform a reload" do
          allow(model).to receive(:respond_to?).and_return(true)
          expect(model).to receive(:reload)

          actor.remember(model: model)

          actor.recall(:model)
        end

        it "avoid a reload for values that do not respond to reload" do
          allow(model).to receive(:respond_to?).and_return(false)
          expect(model).to_not receive(:reload)

          actor.remember(model: model)

          actor.recall(:model)
        end

        it "set the reload argument to false to avoid reload" do
          allow(model).to receive(:respond_to?).and_return(true)
          expect(model).to_not receive(:reload)

          actor.remember(model: model)

          actor.recall(:model, reload: false)
        end
      end
    end
  end
end
