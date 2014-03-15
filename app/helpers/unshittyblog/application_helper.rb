module Unshittyblog
  module ApplicationHelper
    def host_user
      self.parent_controller.send(Unshittyblog.current_user_method)
    end
  end
end
