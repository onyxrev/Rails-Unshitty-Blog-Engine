module Unshittyblog
  class Post < ActiveRecord::Base
    extend FriendlyId
    friendly_id :title, use: :slugged

    acts_as_taggable

    has_many :image_posts
    has_many :images, :through => :image_posts
  end
end
