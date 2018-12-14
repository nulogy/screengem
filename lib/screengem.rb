require "singleton"
require "yaml"

require "active_support"
require "active_support/core_ext"

require "capybara/dsl"

require "screengem/feature_page"
require "screengem/incorrect_answer"
require "screengem/screengem_error"

require "screengem/configuration"
require "screengem/primitive_key"
require "screengem/dampen_configuration"
require "screengem/dampen_configuration_generator"

require "screengem/concerns/actionable"
require "screengem/concerns/configurable"
require "screengem/concerns/dampenable"
require "screengem/concerns/executable"

require "screengem/dsl"

require "screengem/action"
require "screengem/browser_action"
require "screengem/question"
require "screengem/task"

require "screengem/actor"

require "screengem/factories/factory_creation_error"

require "screengem/factories/action_factory"
require "screengem/factories/browser_action_factory"
require "screengem/factories/standard_action_factory"
require "screengem/factories/question_factory"
require "screengem/factories/task_factory"

require "screengem/page_references"

require "screengem/cli"

require "screengem/version"

module Screengem
end
