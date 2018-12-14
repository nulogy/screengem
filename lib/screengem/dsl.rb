module Screengem
  #
  # Mixin that makes tasks and questions available.
  #
  module DSL
    def question
      Screengem::Factories::QuestionFactory.instance
    end

    def task
      Screengem::Factories::TaskFactory.instance
    end
  end
end
