require "unshittyblog/engine"

module Unshittyblog
  mattr_accessor :current_user_method

  require 'haml'
  require 'cells'
  require 'formtastic'
  require 'unshittyblog/router'
end
