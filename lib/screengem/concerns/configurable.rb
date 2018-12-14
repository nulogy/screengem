module Screengem
  #
  # Concern that adds ability to configure with an actor instance.
  #
  module Configurable
    extend ActiveSupport::Concern

    included do
      attr_reader :actor
    end

    def configure(actor)
      @actor = actor

      self
    end
  end
end
