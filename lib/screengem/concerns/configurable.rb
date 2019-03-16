module Screengem
  #
  # Concern that adds ability to configure a primitive with an actor and screen instance.
  #
  module Configurable
    extend ActiveSupport::Concern

    included do
      attr_reader :actor, :screen
    end

    def configure(actor, screen)
      @actor = actor
      @screen = screen

      self
    end
  end
end
