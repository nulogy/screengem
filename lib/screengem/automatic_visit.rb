module Screengem
  #
  # Knows how to decorate public screen element methods with a visit invocation around any public method.
  #
  # This behaviour is turned on for any screen element instance that overrides the visit_path method.
  #
  class AutomaticVisit
    attr_reader :screen_element

    def initialize(screen_element)
      @screen_element = screen_element
    end

    definition = ::RUBY_VERSION >= "2.7" ? "..." : "*args"

    class_eval <<~RUBY, __FILE__, __LINE__ + 1
      def method_missing(method, #{definition})
        if screen_element.respond_to?(method)
          screen_element.visit if auto_visit?(method)

          screen_element.send(method, #{definition})
        else
          super
        end
      end
    RUBY

    def respond_to_missing?(method, *)
      screen_element.respond_to?(method)
    end

    private

    def auto_visit?(method)
      methods_to_decorate.include?(method)
    end

    def methods_to_decorate
      @methods_to_decorate ||= screen_element.public_methods(true) - [:visit, :visit_path]
    end
  end
end
