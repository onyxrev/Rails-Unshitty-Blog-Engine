module Blogocalypse
  module HostUser
    def host_user
      context = host_user_for_self || host_user_for_parent_controller

      # return if we don't have a usable context
      return unless context

      return context.send(Blogocalypse.current_user_method)
    end

    private

    # if we already have access to the host user method, return ourselves
    def host_user_for_self
      if respond_to?(Blogocalypse.current_user_method)
        return self
      end
    end

    # cells often have a parent_controller that has access to the current user method
    def host_user_for_parent_controller
      if kind_of? Cell::Base and
        parent_controller and
        parent_controller.respond_to?(Blogocalypse.current_user_method)

        return parent_controller
      end
    end
  end
end
