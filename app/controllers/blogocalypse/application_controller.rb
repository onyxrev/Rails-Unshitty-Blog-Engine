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

    protected

    def check_permissions(resource, model)
      action    = params[:action].to_sym
      crud_verb = Blogocalypse.action_to_crud_map[action]

      access_denied unless Blogocalypse.can.call host_user, crud_verb, resource, model
    end
  end
end
