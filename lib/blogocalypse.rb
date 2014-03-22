require "blogocalypse/engine"

module Blogocalypse
  mattr_accessor :current_user_method
  mattr_accessor :disqus_shortname
  mattr_accessor :date_format
  mattr_accessor :pagination_count

  require 'cells'
  require 'kaminari'
  require 'blogocalypse/router'
  require 'blogocalypse/host_user'
  require 'acts-as-taggable-on'
  require 'redcarpet'
end
