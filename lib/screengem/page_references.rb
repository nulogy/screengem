module Screengem
  #
  # Singleton that gives the ability to get references to page objects.
  #
  # On initialization generate a factory method for each page object we can find. Example:
  #
  #   def login_page
  #     Pages::LoginPage.new
  #   end
  #
  class PageReferences
    include Singleton

    def initialize
      generated_method_names = []

      Screengem::FeaturePage.descendants.each do |page_object|
        class_name = page_object.name
        method_name = class_name.demodulize.underscore

        if generated_method_names.include?(method_name)
          raise "Name collision: two page objects resolve to '#{method_name}'."
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
