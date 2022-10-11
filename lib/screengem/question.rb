module Screengem
  #
  # Base class for all questions.
  #
  class Question
    include RSpec::Matchers

    include Screengem::Configurable
    include Screengem::Executable

    def answer
      execute
    end
  end
end
