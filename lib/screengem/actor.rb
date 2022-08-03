module Screengem
  #
  # Mixin that allows an actor to perform tasks, ask questions, and to remember and
  # recall tagged values.
  #
  # Return self for those methods that may be chained in the step definition DSL.
  #
  # The ability to remember and recall values is used to carry state forward from one
  # step definition to another (as the preferred alternative to instance variables).
  #
  # Question and task instances (aka primitives) are configured with:
  #   (1) a reference to the actor that is interacting with the primitive
  #   (2) a reference to the screen instance that hosts accessors to the screen elements.
  #
  module Actor
    #
    # Used by an actor to ask one or more questions in a step definition.
    #
    def asks(*questions)
      before_actor_asks(*questions)

      questions.each do |question|
        question.configure(self, screen).answer
      end

      self
    end

    def before_actor_asks(*_questions)
      # Hook to customize actor behaviour.
    end

    #
    # Used by an actor to perform one or more tasks in a step definition.
    #
    def performs(*tasks)
      before_actor_performs(*tasks)

      tasks.each do |task|
        task.configure(self, screen).perform
      end

      self
    end

    def before_actor_performs(*_tasks)
      # Hook to customize actor behaviour.
    end

    #
    # Used by an actor to recall a value for the specified tag.
    #
    def recall(tag, default: nil, reload: true)
      unless recollections.key?(tag) || default.present?
        raise <<~MSG
          #{name} does not recall #{tag}
          #{name} recalls: #{recollections.keys.to_sentence}
        MSG
      end

      recollections.fetch(tag, default).tap do |value|
        value.reload if reload && value.respond_to?(:reload)
      end
    end

    #
    # Used by an actor to remember one or more tagged values.
    #
    def remember(facts)
      recollections.merge!(facts)

      self
    end

    private

    def recollections
      ActorMemory.instance.recollections(self)
    end

    def screen
      Screengem::ScreenElements.instance
    end
  end
end
