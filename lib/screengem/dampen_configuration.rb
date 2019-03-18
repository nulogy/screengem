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
    # Knows how to build a dampen configuration.
    #
    class DampenConfigurationFactory
      def build_configuration
        if dampening_configured?
          DampenConfiguration::Standard.new(load_configuration)
        else
          DampenConfiguration::None.new
        end
      end

      private

      def dampening_configured?
        apply_dampening? && configuration_file_exists?
      end

      def apply_dampening?
        Screengem.configuration.apply_dampening?
      end

      def configuration_file_exists?
        File.exist?(configuration_yaml)
      end

      def load_configuration
        YAML.load_file(configuration_yaml)
      end

      def configuration_yaml
        Screengem.configuration.dampen_configuration_filename
      end
    end

    #
    # Respond by looking up seconds to dampen in the specified settings.
    #
    class Standard
      include Screengem::PrimitiveKey

      attr_reader :settings

      def initialize(settings)
        @settings = ActiveSupport::HashWithIndifferentAccess.new(settings).fetch(dampen_configuration_root, {})
      end

      def seconds_to_dampen(primitive_scope, primitive_class_name)
        settings.dig(primitive_scope, primitive_key(primitive_class_name)).to_i
      end

      private

      def dampen_configuration_root
        Screengem.configuration.dampen_configuration_root
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
