# Require the RSpec configuration
require "spec_helper"

# Require the Screengem gem
require "screengem"

# Require the shared Screengem sample primitives
require "support/screengem_fixture"

# Require the shared examples
Dir["./spec/support/shared_examples/*.rb"].sort.each { |f| require f }

# Configure the Screengem gem
Screengem.configure do |config|
  config.apply_dampening = false
end
