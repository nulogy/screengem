module Screengem
  module Factories
    #
    # Makes browser actions available.
    #
    class BrowserActionFactory < Screengem::Factories::ActionFactory
      include ::Singleton

      def raw_action_class_name(action_name)
        "#{action_name}_action_browser"
      end
    end
  end
end
