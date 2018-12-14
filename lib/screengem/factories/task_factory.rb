module Screengem
  module Factories
    #
    # Knows how to create a Task from a task name.
    #
    class TaskFactory < BasicObject
      include ::Singleton

      def method_missing(task_name, *args) # rubocop:disable Style/MethodMissingSuper
        task_class_name = "#{task_name}_task".camelize
        task_class = "#{task_scope}::#{task_class_name}".constantize

        task_class.new(*args)
      rescue => e
        TaskError.new(<<~MSG)
          Unable to create task: '#{task_class_name}'.
            Details: #{e.message}
        MSG
      end

      def respond_to_missing?(_task_name, *)
        true
      end

      class TaskError < ::Screengem::Task
        include FactoryCreationError

        skip_dampening
      end

      private

      def task_scope
        @task_scope ||= ::Screengem.configuration.task_scope
      end
    end
  end
end
