module Screengem
  module Factories
    #
    # Knows how to create a Question from a question name.
    #
    class QuestionFactory < BasicObject
      include ::Singleton

      definition = ::RUBY_VERSION >= "2.7" ? "..." : "*args"

      class_eval <<~RUBY, __FILE__, __LINE__ + 1
        def method_missing(question_name, #{definition})
          question_class_name = "\#{question_name}_question".camelize
          question_class = "\#{question_scope}::\#{question_class_name}".constantize

          question_class.new(#{definition})
        rescue => e
          QuestionError.new(<<~MSG)
            Unable to create question: '\#{question_class_name}'.
              Details: \#{e.message}
          MSG
        end
      RUBY

      def respond_to_missing?(_question_name, *)
        true
      end

      class QuestionError < ::Screengem::Question
        include FactoryCreationError
      end

      private

      def question_scope
        @question_scope ||= ::Screengem.configuration.question_scope
      end
    end
  end
end
