module Blogocalypse
  class BaseCell < Cell::Rails
    # allows us to get at the host Rails app's sessions
    include Blogocalypse::HostUser
  end
end
