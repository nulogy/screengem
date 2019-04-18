module Screengem
  #
  # Singleton that gives the ability to get references to screen elements.
  #
  # On initialization generate a factory method for each screen element we can find. Example:
  #
  #   def login_page
  #     ScreenElements::LoginPage.new
  #   end
  #
  class ScreenElements
    include ::Singleton

    def initialize
      generated_method_names = []

      Screengem::ScreenElement.descendants.each do |screen_element|
        class_name = screen_element.name
        method_name = class_name.demodulize.underscore

        if generated_method_names.include?(method_name)
          raise "Name collision: two screen elements resolve to '#{method_name}'."
        end

        generated_method_names << method_name

        class_eval(<<~RUBY, __FILE__, __LINE__ + 1)
          def #{method_name}(*args)
            #{class_name}.new(*args)
          end
        RUBY
      end
    end
  end
end
