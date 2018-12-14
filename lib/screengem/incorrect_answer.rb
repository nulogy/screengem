module Screengem
  #
  # Common error to signal a question that was answered incorrectly.
  #
  class IncorrectAnswer < RuntimeError
    def initialize(question)
      super(extract_question_text(question))
    end

    private

    #
    # Transforms question class name into a text message.
    #
    # Example:
    #
    #   Questions::SignatureCapturedQuestion is transformed to 'Signature captured?'.
    #
    def extract_question_text(question)
      question.class.name.demodulize.underscore.humanize.gsub(" question", "?")
    end
  end
end
