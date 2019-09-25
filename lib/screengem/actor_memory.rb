module Screengem
  #
  # Ensures that the memory/recollections that an actor uses are effectively global (using the actor name).
  #
  # This is required to use Cucumber ParameterTypes because the block arguments are cloned before they are
  # provided to the step definitions. This is intentional by the cucumber team to prevent leaking state
  # between step definitions. See https://github.com/cucumber/cucumber-ruby/issues/1275.
  #
  # The cloning of the actor means that is is effectively treated like a value object, and there will be
  # many instances of the same actor instantiated in the execution of a single test.
  #
  class ActorMemory
    include ::Singleton

    def recollections(actor)
      @recollections ||= ActiveSupport::HashWithIndifferentAccess.new
      @recollections[actor.name] ||= ActiveSupport::HashWithIndifferentAccess.new
    end

    #
    # Use this method to clear actor memory to avoid actor memory persisting across scenarios.
    #
    def clear
      @recollections = ActiveSupport::HashWithIndifferentAccess.new
    end
  end
end
