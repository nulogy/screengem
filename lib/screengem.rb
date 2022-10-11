require "singleton"
require "yaml"

require "active_support"
require "active_support/core_ext"

require "capybara/dsl"
require "rspec/expectations"

require "screengem/automatic_visit"
require "screengem/rails_routes"
require "screengem/screen_element"
require "screengem/screengem_error"

require "screengem/configuration"

require "screengem/concerns/configurable"
require "screengem/concerns/executable"

require "screengem/dsl"

require "screengem/question"
require "screengem/task"

require "screengem/actor_memory"
require "screengem/actor"

require "screengem/factories/factory_creation_error"

require "screengem/factories/question_factory"
require "screengem/factories/task_factory"

require "screengem/screen_elements"

require "screengem/version"

module Screengem
end
