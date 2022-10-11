module Screengem
  module Factories
    #
    # Knows how to create a Question from a question name.
    #
    class QuestionFactory < BasicObject
      include ::Singleton

      def method_missing(question_name, *args)
        question_class_name = "#{question_name}_question".camelize
        question_class = "#{question_scope}::#{question_class_name}".constantize

        question_class.new(*args)
      rescue => e
        QuestionError.new(<<~MSG)
          Unable to create question: '#{question_class_name}'.
            Details: #{e.message}
        MSG
      end

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
