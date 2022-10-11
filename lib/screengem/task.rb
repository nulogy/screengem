module Screengem
  #
  # Base class for all tasks.
  #
  class Task
    include RSpec::Matchers

    include Screengem::Configurable
    include Screengem::Executable

    include Screengem::DSL

    def perform
      execute
    end
  end
end
