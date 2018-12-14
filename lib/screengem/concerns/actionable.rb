module Screengem
  #
  # Concern that adds the ability to create actions.
  #
  module Actionable
    extend ActiveSupport::Concern

    def action
      @action ||= action_factory
    end

    private

    #
    # Choose the specified action factory. Default to the standard action factory.
    #
    def action_factory
      if browser_factory?
        Screengem::Factories::BrowserActionFactory.instance
      else
        Screengem::Factories::StandardActionFactory.instance
      end
    end

    def browser_factory?
      Screengem.configuration.browser_actions?
    end
  end
end
