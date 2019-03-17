module Screengem
  module Factories
    #
    # Knows the behaviour for error creation primitives.
    #
    module FactoryCreationError
      def initialize(error_message)
        @error_message = error_message
      end

      def execute
        raise Screengem::ScreengemError, @error_message
      end
    end
  end
end
