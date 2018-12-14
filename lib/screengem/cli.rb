require "require_all"
require "thor"

module Screengem
  class CLI < Thor
    option :root
    option :config, default: "dampen_configuration.yml"
    option :questions, default: "questions"
    option :tasks, default: "tasks"
    option :quiet, default: false
    desc "generate", "Create the sample dampening configuration"
    def generate
      root = options[:root]

      # Require all questions and tasks for inclusion in the sample configuration.
      require_all File.join(root, options[:questions])
      require_all File.join(root, options[:tasks])

      Screengem.configure do |config|
        config.dampen_configuration_filename = File.join(root, options[:config])
      end

      sample_filename = Screengem.configuration.dampen_configuration_sample_filename

      puts "Regenerating #{sample_filename} ..." unless options[:quiet]

      sample_configuration = Screengem::DampenConfigurationGenerator.new.generate

      File.write(sample_filename, sample_configuration.to_yaml)
    end
  end
end
