require "blogocalypse/engine"

module Blogocalypse
  mattr_accessor :current_user_method
  mattr_accessor :disqus_shortname
  mattr_accessor :date_format
  mattr_accessor :pagination_count
  mattr_accessor :default_image_size

  require 'cells'
  require 'kaminari'
  require 'acts-as-taggable-on'
  require 'redcarpet'
  require 'blogocalypse/router'
  require 'blogocalypse/host_user'
  require 'blogocalypse/markdown'
end
