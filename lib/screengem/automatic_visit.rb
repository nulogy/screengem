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

    def method_missing(method, *args)
      if screen_element.respond_to?(method)
        forward_with_auto_visit(method, args)
      else
        super
      end
    end

    def respond_to_missing?(method, *)
      screen_element.respond_to?(method)
    end

    private

    def forward_with_auto_visit(method, args)
      screen_element.visit if auto_visit?(method)

      screen_element.send(method, *args)
    end

    def auto_visit?(method)
      methods_to_decorate.include?(method)
    end

    def methods_to_decorate
      @methods_to_decorate ||= screen_element.public_methods(false) - [:visit, :visit_path]
    end
  end
end
