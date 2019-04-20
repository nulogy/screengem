module Screengem
  #
  # Base class for all screen elements.
  #
  # Calling visit does nothing when currently navigated to the target.
  #
  class ScreenElement
    include Capybara::DSL

    def visit(visit_uri = visit_path)
      return if visit_uri == page.current_path

      page.visit(visit_uri)
    end

    #
    # Subclasses override the visit_path method to participate in auto visit.
    # See Screengem::AutomaticVisit.
    #
    def visit_path
    end
  end
end
