require "screengem_spec_helper"

module Screengem
  RSpec.describe Task do
    let(:actor) { Class.new { include Actor }.new }
    let(:screen) { double("Screen") } # rubocop:disable RSpec/VerifiedDoubles

    describe "basic task" do
      let(:task) { Support::ScreengemFixture.task_1.new }
      let(:configured_task) { task.configure(actor, screen) }

      it "calling perform calls execute on task" do
        expect(configured_task).to receive(:execute).and_call_original

        configured_task.perform
      end

      it "implements two phase initialization" do
        expect(task).to have_attributes(actor: nil)
        expect(configured_task).to have_attributes(actor: actor, screen: screen)
      end

      it "all tasks support dampening unless overridden with skip_dampening" do
        expect(Support::ScreengemFixture.task_1.supports_dampening?).to eq(true)
      end

      it "warns subclasses to implement the execute method" do
        base = Screengem::Task.new

        expect { base.execute }.to raise_error(RuntimeError, /You must define an execute method/)
      end
    end

    describe "composite task" do
      let(:composite_task) { Support::ScreengemFixture.composite_task.new }
      let(:configured_composite_task) { composite_task.configure(actor, screen) }

      before do
        Screengem.configure do |config|
          config.task_scope = "Support::ScreengemFixture::Tasks"
        end
      end

      it "performs each component task" do
        last_component_class = configured_composite_task.last_component_class
        allow_any_instance_of(last_component_class).to receive(:execute).and_raise(last_component_class.name)

        expect { configured_composite_task.perform }.to raise_error(
          RuntimeError, /Support::ScreengemFixture::Tasks::TaskTwoTask/
        )
      end
    end
  end
end
