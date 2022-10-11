module Screengem
  RSpec.describe DampenConfiguration do
    let(:dampen_configuration) do
      {
        default: {
          questions: {
            form_has_status: 2,
            form_has_title: 2,
            form_visible: 2
          },
          tasks: {
            select_form: 3,
            select_form_action: 2
          }
        }
      }
    end

    before do
      Screengem.configure do |config|
        config.apply_dampening = false
        config.dampen_configuration_filename = "some_filename"
        config.dampen_configuration_root = "default"
      end
    end

    describe "converts a class name to a configuration key" do
      let(:configuration_instance) { described_class.instance }

      it "for a question" do
        class_name = "Questions::ExampleQuestion"

        expect(configuration_instance.dampen_configuration_key(class_name)).to eq("example")
      end

      it "for a task" do
        class_name = "Tasks::ExampleComplexTask"

        expect(configuration_instance.dampen_configuration_key(class_name)).to eq("example_complex")
      end
    end

    describe "factory" do
      before do
        allow(File).to receive(:exist?).with("some_filename").and_return(true)
        allow(YAML).to receive(:load_file).with("some_filename").and_return(dampen_configuration)
      end

      let(:factory) { DampenConfiguration::DampenConfigurationFactory.new }

      it "configured to not apply dampening" do
        Screengem.configuration.apply_dampening = false

        dampen_configuration = factory.build_configuration

        expect(dampen_configuration).to be_a(Screengem::DampenConfiguration::None)
      end

      it "configured to apply dampening" do
        Screengem.configuration.apply_dampening = true

        dampen_configuration = factory.build_configuration

        expect(dampen_configuration).to be_a(Screengem::DampenConfiguration::Standard)
      end
    end

    describe "standard configuration" do
      let(:standard) { DampenConfiguration::Standard.new(dampen_configuration) }

      it "question with configuration" do
        question_class_name = "Questions::FormHasTitle"

        expect(standard.seconds_to_dampen(:questions, question_class_name)).to eq(2)
      end

      it "question without configuration" do
        question_class_name = "Questions::SomeName"

        expect(standard.seconds_to_dampen(:questions, question_class_name)).to eq(0)
      end

      it "task with configuration" do
        task_class_name = "Tasks::SelectForm"

        expect(standard.seconds_to_dampen(:tasks, task_class_name)).to eq(3)
      end

      it "task without configuration" do
        task_class_name = "Tasks::SomeName"

        expect(standard.seconds_to_dampen(:tasks, task_class_name)).to eq(0)
      end
    end

    describe "no dampening configuration" do
      let(:none) { DampenConfiguration::None.new }

      it "for question" do
        question_class_name = "Questions::SomeName"

        expect(none.seconds_to_dampen(:question, question_class_name)).to be_zero
      end

      it "for task" do
        task_class_name = "Tasks::SelectForm"

        expect(none.seconds_to_dampen(:task, task_class_name)).to be_zero
      end
    end
  end
end
