module Screengem
  #
  # Base class for all questions.
  #
  class Question
    include RSpec::Matchers

    include Screengem::Configurable
    include Screengem::Dampenable
    include Screengem::Executable

    def answer
      execute.tap { sleep(seconds_to_dampen) }
    end
  end
end
