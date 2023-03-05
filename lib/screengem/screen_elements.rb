module Screengem
  #
  # Singleton that gives the ability to get references to screen elements.
  #
  # On initialization generate a factory method for each screen element. If the screen element
  # defines a visit_path method then we wrap the screen element to support auto visit.
  #
  # Examples:
  #
  #   def login_page
  #     ScreenElements::LoginPage.new
  #   end
  #
  #   def login_page
  #     Screengem::AutomaticVisit.new(ScreenElements::LoginPage.new)
  #   end
  #
  class ScreenElements
    include ::Singleton

    def initialize
      generated_method_names = []

      Screengem::ScreenElement.descendants.each do |screen_element_class|
        # Skip any anonymous classes. We can't do anything with them. Probably they're from testing.
        next if screen_element_class.anonymous?

        class_name = screen_element_class.name
        method_name = class_name.demodulize.underscore

        # Create some safety by detecting and failing fast for duplicate creation method names.
        if generated_method_names.include?(method_name)
          raise "Name collision: two screen elements resolve to '#{method_name}'."
        end

        generated_method_names << method_name

        if auto_visit?(screen_element_class)
          class_eval(<<~RUBY, __FILE__, __LINE__ + 1)
            def #{method_name}(...)
              Screengem::AutomaticVisit.new(#{class_name}.new(...))
            end
          RUBY
        else
          class_eval(<<~RUBY, __FILE__, __LINE__ + 1)
            def #{method_name}(...)
              #{class_name}.new(...)
            end
          RUBY
        end
      end
    end

    private

    def auto_visit?(screen_element)
      screen_element.instance_methods(false).include?(:visit_path)
    end
  end
end
