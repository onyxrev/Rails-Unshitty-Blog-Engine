require "unshittyblog/engine"

module Unshittyblog
  mattr_accessor :current_user_method

  require 'cells'
  require 'unshittyblog/router'
end
