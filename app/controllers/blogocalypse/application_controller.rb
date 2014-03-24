module Blogocalypse
  class ApplicationController < ActionController::Base
    include Blogocalypse::ApplicationHelper

    # use the host app's layout
    layout "application"

    def not_found
      raise ActionController::RoutingError.new('Not Found')
    end

    def access_denied(message = nil)
      raise Blogocalypse::AccessDenied.new(message)
    end
  end
end
