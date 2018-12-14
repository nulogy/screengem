module Screengem
  #
  # Mixin that knows how to generate the primitive key for a dampening configuration.
  #
  module PrimitiveKey
    def primitive_key(primitive_class_name)
      Screengem::DampenConfiguration.instance.dampen_configuration_key(primitive_class_name)
    end
  end
end
