module Screengem
  module Factories
    RSpec.describe TaskFactory do
      subject(:task_factory) { described_class.instance }

      before do
        Screengem.configure do |config|
          config.task_scope = "Support::ScreengemFixture::Tasks"
        end
      end

      it "creates task" do
        task = task_factory.task_one

        expect(task).to be_a(Support::ScreengemFixture.task_1)
      end

      it "creates error task for unknown tasks" do
        task = task_factory.unknown

        expect(task).to be_a(TaskFactory::TaskError)
        expect { task.execute }.to raise_error(Screengem::ScreengemError, /Unable to create task: 'UnknownTask'/)
      end
    end
  end
end
