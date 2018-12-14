module Screengem
  #
  # Mixin that gives the ability to get references to page objects.
  #

  # rubocop:disable Style/GuardClause
  module PageReferences
    def self.extended(_mod)
      # One time definition of the page object references.
      return unless PageReferences.instance_methods.empty?

      #
      # Generate a factory method for each page object we can find.
      #
      # Example:
      #
      #   def login_page
      #     @login_page ||= Pages::LoginPage.new
      #   end
      #
      generated_method_names = []

      Screengem::FeaturePage.descendants.each do |page_object|
        class_name = page_object.name
        method_name = class_name.demodulize.underscore

        if generated_method_names.include?(method_name)
          raise "Name collision: two page objects resolve to '#{method_name}'."
        else
          generated_method_names << method_name
        end

        module_eval(<<~RUBY, __FILE__, __LINE__ + 1)
          def #{method_name}
            @#{method_name} ||= #{class_name}.new
          end
        RUBY
      end
    end
  end
  # rubocop:enable Style/GuardClause
end
