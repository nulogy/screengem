# Require the RSpec configuration
require "spec_helper"

# Require the Screengem gem
require "screengem"

# Require the shared Screengem sample primitives
require "support/screengem_fixture"

# Configure the Screengem gem
Screengem.configure do |config|
  config.apply_dampening = false
end
