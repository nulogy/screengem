module Screengem
  #
  # Base class for all tasks.
  #
  class Task
    include RSpec::Matchers

    include Screengem::Configurable
    include Screengem::Dampenable
    include Screengem::Executable

    include Screengem::DSL

    dampen_scope :tasks

    def perform
      execute.tap { sleep(seconds_to_dampen) }
    end
  end
end
