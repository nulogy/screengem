module Support
  #
  # A globally shared test fixture that defines a sample set of
  # Screengem primitives: questions and tasks.
  #
  module ScreengemFixture
    module Questions
      class QuestionOneQuestion < Screengem::Question
        def execute
        end
      end

      class QuestionTwoQuestion < Screengem::Question
        skip_dampening

        def execute
        end
      end

      class QuestionThreeQuestion < Screengem::Question
        def execute
        end
      end
    end

    module Tasks
      class TaskOneTask < Screengem::Task
        def execute
        end
      end

      class TaskTwoTask < Screengem::Task
        def execute
        end
      end

      class TaskThreeTask < Screengem::Task
        skip_dampening

        def execute
        end
      end

      class TaskFourTask < Screengem::Task
        skip_dampening

        def execute
          actor.performs(task.task_one, task.task_two)
        end

        def last_component_class
          TaskTwoTask
        end
      end
    end

    #
    # Convenience methods for questions
    #
    def self.question_1
      Support::ScreengemFixture::Questions::QuestionOneQuestion
    end

    def self.question_2
      Support::ScreengemFixture::Questions::QuestionTwoQuestion
    end

    def self.question_3
      Support::ScreengemFixture::Questions::QuestionThreeQuestion
    end

    def self.question_supports_dampening
      question_1
    end

    def self.question_skips_dampening
      question_2
    end

    #
    # Convenience methods for tasks
    #
    def self.task_1
      Support::ScreengemFixture::Tasks::TaskOneTask
    end

    def self.task_2
      Support::ScreengemFixture::Tasks::TaskTwoTask
    end

    def self.task_3
      Support::ScreengemFixture::Tasks::TaskThreeTask
    end

    def self.task_4
      Support::ScreengemFixture::Tasks::TaskFourTask
    end

    def self.task_supports_dampening
      task_1
    end

    def self.task_skips_dampening
      task_3
    end

    def self.composite_task
      task_4
    end
  end
end
