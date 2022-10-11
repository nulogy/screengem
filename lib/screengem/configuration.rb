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
    # The name of the YAML file that is used to configure dampening.
    attr_accessor :dampen_configuration_filename

    # The top level key in the YAML file that is used to configure dampening.
    attr_accessor :dampen_configuration_root

    # A boolean that specifies that dampening is to be applied.
    attr_accessor :apply_dampening

    # A string that namespaces questions classes (used by the QuestionFactory).
    attr_accessor :question_scope

    # A string that namespaces task classes (used by the TaskFactory).
    attr_accessor :task_scope

    def initialize
      self.apply_dampening = false

      self.dampen_configuration_root = "default"

      self.question_scope = "Questions"
      self.task_scope = "Tasks"
    end

    def apply_dampening?
      apply_dampening
    end

    def dampen_configuration_sample_filename
      "#{dampen_configuration_filename}.sample"
    end
  end
end
