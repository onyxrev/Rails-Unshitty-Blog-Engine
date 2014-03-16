module Blogocalypse
  module HostUser
    def host_user
      # try to find the controller context
      if respond_to?(Blogocalypse.current_user_method)
        # oh shit it's us!
        context = self
      elsif self.kind_of? Cell::Base and parent_controller
        # cells usually have a parent controller
        context = parent_controller
      else
        # ugh. no dice
        return nil
      end

      context.send(Blogocalypse.current_user_method)
    end
  end
end
