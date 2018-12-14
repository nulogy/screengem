module Screengem
  #
  # Mixin that allows an actor to perform tasks, ask questions, take actions, and
  # to remember and recall tagged values.
  #
  # Return self for those methods that may be chained in the step definition DSL.
  #
  # The ability to remember and recall values is used to carry state forward from one
  # step definition to another (as the preferred alternative to instance variables).
  #
  # Action, question, and task instances are extended with PageReferences so that
  # they can interact with the application via page objects.
  #
  module Actor
    #
    # Used by an actor to ask one or more questions in a step definition.
    #
    def asks(*questions)
      questions.each do |question|
        question.configure(self).extend(page_references)

        next if question.answer

        raise incorrect_answer(question)
      end

      self
    end

    #
    # Used by an actor to perform one or more tasks in a step definition.
    #
    def performs(*tasks)
      tasks.each do |task|
        task.configure(self).extend(page_references)

        task.perform
      end

      self
    end

    #
    # Used by an actor to recall a value for the specified tag.
    #
    def recall(tag)
      recollections.fetch(tag)
    end

    #
    # Used by an actor to remember one or more tagged values.
    #
    def remember(facts)
      recollections.merge!(facts)

      self
    end

    #
    # Used by an actor to take one or more actions.
    #
    # Used to implement tasks. Actions do not appear in step definitions.
    #
    def takes_action(*actions)
      actions.each do |action|
        action.configure(self).extend(page_references)

        action.execute
      end
    end

    private

    def incorrect_answer(question)
      Screengem::IncorrectAnswer.new(question)
    end

    def page_references
      @page_references ||= Screengem::PageReferences
    end

    def recollections
      @recollections ||= ActiveSupport::HashWithIndifferentAccess.new
    end
  end
end
