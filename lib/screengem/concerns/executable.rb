module Screengem
  #
  # Concern for adding the command pattern.
  #
  module Executable
    extend ActiveSupport::Concern

    #
    # Subclasses must implement an execute method.
    #
    def execute
      raise "You must define an execute method"
    end
  end
end
