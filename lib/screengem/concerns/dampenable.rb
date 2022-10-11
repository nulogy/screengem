module Screengem
  #
  # Concern for adding dampening to primitives.
  #
  module Dampenable
    extend ActiveSupport::Concern

    class_methods do
      #
      # Since most primitives may be dampened.
      #
      def supports_dampening?
        true
      end

      #
      # Specify a primitive subclass with no dampening.
      #
      def skip_dampening
        define_singleton_method(:supports_dampening?) do
          false
        end
      end
    end

    def seconds_to_dampen
      0
    end

    private

    def dampen_configuration
      Screengem::DampenConfiguration.instance.configuration
    end
  end
end
