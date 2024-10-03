module Screengem
  #
  # Base class for all screen elements.
  #
  # Calling visit does nothing when currently navigated to the target.
  #
  class ScreenElement
    include Capybara::DSL
    include Screengem::RailsRoutes

    def visit(visit_uri = visit_path)
      return if visit_uri == current_uri

      page.visit(visit_uri)
    end

    #
    # Subclasses override the visit_path method to participate in auto visit.
    # See Screengem::AutomaticVisit.
    #
    def visit_path
    end

    private

    #
    # Screen elements may define a visit_path that includes these elements
    # of a URI: the path, a query string, and a fragment. We consider only
    # the path and the fragment when building the current_uri.
    #
    # This has the somewhat surprising consequence that a visit_path that contains
    # a query string will never match the current_uri meaning that we will always
    # auto visit. This preserves the behaviour in versions prior to 0.21.x.
    #
    def current_uri
      uri = URI(page.current_url)

      current_uri = uri.path
      current_uri += "##{uri.fragment}" if uri.fragment.present?

      current_uri
    end
  end
end
