module Blogocalypse
  class Post < ActiveRecord::Base
    extend FriendlyId
    friendly_id :title, use: :slugged

    acts_as_taggable

    has_many :image_posts
    has_many :images, :through => :image_posts, :dependent => :destroy

    accepts_nested_attributes_for :images

    before_save :associate_images_from_body_markup

    private

    def associate_images_from_body_markup
      image_ids = body.scan(/image_id\:([0-9]*)/).flatten.map(&:to_i)

      self.images = Image.where(:id => image_ids)
    end
  end
end
