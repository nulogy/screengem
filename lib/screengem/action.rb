module Screengem
  #
  # Base class for all actions.
  #
  class Action
    include RSpec::Matchers

    include Screengem::Configurable
    include Screengem::Executable
  end
end
