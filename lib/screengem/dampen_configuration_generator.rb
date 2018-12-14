module Screengem
  #
  # Knows how to generate the sample dampen configuration.
  #
  class DampenConfigurationGenerator
    include Screengem::PrimitiveKey

    # Seconds to sleep after executing a question or task.
    DEFAULT_SLEEP = 2

    def generate
      configuration = empty_configuration

      default_configuration = configuration["default"]

      default_configuration["questions"] = all_questions
      default_configuration["tasks"] = all_tasks

      configuration
    end

    private

    def empty_configuration
      {
        "default" => {
          "questions" => {},
          "tasks" => {}
        }
      }
    end

    def all_questions
      all_primitives(Screengem::Question)
    end

    def all_tasks
      all_primitives(Screengem::Task)
    end

    def all_primitives(primitive_root)
      sorted_descendents(primitive_root).each_with_object({}) do |primitive_class, memo|
        next unless apply_dampening?(primitive_class)

        memo[primitive_key(primitive_class.name)] = DEFAULT_SLEEP
      end
    end

    def sorted_descendents(primitive_root)
      primitive_root.descendants.sort_by { |primitive_class| primitive_key(primitive_class.name) }
    end

    def apply_dampening?(primitive_class)
      primitive_class.supports_dampening? && primitive_class.descendants.empty?
    end
  end
end
