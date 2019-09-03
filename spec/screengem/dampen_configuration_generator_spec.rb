module Screengem
  RSpec.describe DampenConfigurationGenerator do
    subject(:generator) { described_class.new }

    it "generates a configuration as expected" do
      expect(generator.generate).to include(
        "default" => {
          "questions" => {
            "question_one" => 2,
            "question_three" => 2
          },
          "tasks" => {
            "task_one" => 2,
            "task_two" => 2
          }
        }
      )
    end
  end
end
