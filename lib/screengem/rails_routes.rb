module Screengem
  #
  # Exposes the Rails application routes.
  #
  module RailsRoutes
    def routes
      Rails.application.routes if defined?(Rails)
    end
  end
end
