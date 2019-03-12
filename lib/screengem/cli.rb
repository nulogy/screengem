require "require_all"
require "thor"

module Screengem
  class CLI < Thor
    option :root, desc: "The directory to start scanning for Tasks and Questions"
    option :config, default: "dampen_configuration.yml", desc: "The name of the dampen configuration file"
    option :quiet, default: false, desc: "Suppress command output"
    desc "generate", "Create the sample dampening configuration"
    def generate
      root = options[:root]

      # Require all questions and tasks for inclusion in the sample configuration.
      require_all root

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
