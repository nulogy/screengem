module Screengem
  class << self
    attr_accessor :configuration
  end

  #
  # Expose the configuration to users of the Screengem gem.
  #
  def self.configure
    self.configuration ||= Screengem::Configuration.new

    yield(configuration) if block_given?
  end

  #
  # Configuration for the Screengem gem.
  #
  class Configuration
    # A string that namespaces questions classes (used by the QuestionFactory).
    attr_accessor :question_scope

    # A string that namespaces task classes (used by the TaskFactory).
    attr_accessor :task_scope

    def initialize
      self.question_scope = "Questions"
      self.task_scope = "Tasks"
    end
  end
end
