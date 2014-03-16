module Unshittyblog
  class Image < ActiveRecord::Base
    dragonfly_accessor :image

    has_many :image_posts
    has_many :posts, :through => :image_posts
  end
end
