module Screengem
  module Factories
    #
    # Knows how to create a Task from a task name.
    #
    class TaskFactory < BasicObject
      include ::Singleton

      definition = ::RUBY_VERSION >= "3.0" ? "..." : "*args"

      class_eval <<~RUBY, __FILE__, __LINE__ + 1
        def method_missing(task_name, #{definition})
          task_class_name = "\#{task_name}_task".camelize
          task_class = "\#{task_scope}::\#{task_class_name}".constantize

          task_class.new(#{definition})
        rescue => e
          TaskError.new(<<~MSG)
            Unable to create task: '\#{task_class_name}'.
              Details: \#{e.message}
          MSG
        end
      RUBY

      def respond_to_missing?(_task_name, *)
        true
      end

      class TaskError < ::Screengem::Task
        include FactoryCreationError
      end

      private

      def task_scope
        @task_scope ||= ::Screengem.configuration.task_scope
      end
    end
  end
end
