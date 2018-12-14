module Screengem
  module Factories
    #
    # Makes standard actions available.
    #
    class StandardActionFactory < Screengem::Factories::ActionFactory
      include ::Singleton

      def raw_action_class_name(action_name)
        "#{action_name}_action"
      end
    end
  end
end
