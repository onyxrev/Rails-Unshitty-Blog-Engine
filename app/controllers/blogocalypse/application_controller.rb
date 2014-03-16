module Blogocalypse
  class ApplicationController < ActionController::Base
    # use the host app's layout
    layout "application"

    def not_found
      raise ActionController::RoutingError.new('Not Found')
    end
  end
end
