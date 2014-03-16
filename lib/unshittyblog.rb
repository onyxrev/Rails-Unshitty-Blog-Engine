require "unshittyblog/engine"

module Unshittyblog
  mattr_accessor :current_user_method
  mattr_accessor :disqus_shortname
  mattr_accessor :date_format
  mattr_accessor :pagination_count

  require 'cells'
  require 'kaminari'
  require 'unshittyblog/router'
  require 'unshittyblog/host_user'
  require 'acts-as-taggable-on'
end
