module Screengem
  module Factories
    #
    # Makes actions available to tasks.
    #
    class ActionFactory < BasicObject
      def method_missing(action_name, *args) # rubocop:disable Style/MethodMissingSuper
        action_class_name = raw_action_class_name(action_name).camelize
        action_class = "#{action_scope}::#{action_class_name}".constantize

        action_class.new(*args)
      rescue => e
        ActionError.new(<<~MSG)
          Unable to create action: '#{action_class_name}'.
            Details: #{e.message}
        MSG
      end

      def respond_to_missing?(_action_name, *)
        true
      end

      class ActionError < ::Screengem::Action
        include FactoryCreationError
      end

      private

      def action_scope
        @action_scope ||= ::Screengem.configuration.action_scope
      end
    end
  end
end
