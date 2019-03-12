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

      #
      # Specify the dampening configuration scope.
      #
      def dampen_scope(scope)
        define_method(:dampening_scope) do
          scope
        end
      end

      #
      # Specify dampening to apply to a primitive.
      #
      def dampen_for(seconds)
        define_singleton_method(:seconds_to_dampen) do
          seconds
        end
      end
    end

    def seconds_to_dampen
      dampen_configuration.seconds_to_dampen(dampening_scope, self.class.name)
    end

    private

    def dampen_configuration
      Screengem::DampenConfiguration.instance.configuration
    end
  end
end
