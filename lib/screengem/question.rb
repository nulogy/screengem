module Screengem
  #
  # Base class for all questions.
  #
  class Question
    include Screengem::Configurable
    include Screengem::Dampenable
    include Screengem::Executable

    dampen_scope :questions

    def answer
      execute.tap { sleep(seconds_to_dampen) }
    end
  end
end
