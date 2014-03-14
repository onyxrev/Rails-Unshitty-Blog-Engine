module Unshittyblog
  class ApplicationController < ActionController::Base
    # allows multiple flash messages to be aggregated for a type
    def add_to_flash(type, message)
      flash[type] = Array(flash[type])
      flash[type] << message
    end

    def not_found
      raise ActionController::RoutingError.new('Not Found')
    end
  end
end
