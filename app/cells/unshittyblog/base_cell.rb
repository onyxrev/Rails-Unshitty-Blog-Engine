module Unshittyblog
  class BaseCell < Cell::Rails
    # allows us to get at the host Rails app's sessions
    include Unshittyblog::HostUser
  end
end
