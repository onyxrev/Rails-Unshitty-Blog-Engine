require "unshittyblog/engine"

module Unshittyblog
  mattr_accessor :current_user_method
  mattr_accessor :disqus_shortname

  require 'cells'
  require 'unshittyblog/router'
  require 'acts-as-taggable-on'
end
