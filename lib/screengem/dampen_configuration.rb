module Screengem
  #
  # Exposes the question and task sleep intervals as defined in the dampening configuration.
  #
  class DampenConfiguration
    include ::Singleton

    attr_reader :configuration

    def initialize
      @configuration = DampenConfigurationFactory.new.build_configuration
    end

    def dampen_configuration_key(primitive_class_name)
      primitive_class_name.demodulize.underscore.gsub(/_(question|task)$/, "")
    end

    #
    # Knows how to build a no dampening configuration.
    #
    class DampenConfigurationFactory
      def build_configuration
        DampenConfiguration::None.new
      end

      private

      def dampening_configured?
        false
      end

      def apply_dampening?
        false
      end

      def configuration_file_exists?
        false
      end
    end

    #
    # Always respond with no dampening.
    #
    class None
      def seconds_to_dampen(_primitive_scope, _primitive_class_name)
        0
      end
    end
  end
end
