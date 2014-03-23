module Blogocalypse
  class Post < ActiveRecord::Base
    extend FriendlyId
    friendly_id :title, use: :slugged

    acts_as_taggable

    has_many :image_posts
    has_many :images, :through => :image_posts, :dependent => :destroy

    accepts_nested_attributes_for :images

    before_save :associate_images_from_body_markup

    attr_accessor :should_recreate_slug

    private

    def should_generate_new_friendly_id?
      self.slug.blank? or ActiveRecord::ConnectionAdapters::Column.value_to_boolean(self.should_recreate_slug)
    end

    def initialize(*args)
      super(*args)

      self.title = "Untitled Post" if self.title.blank?
    end

    def associate_images_from_body_markup
      image_ids = body.scan(/image_id\:([0-9]*)/).flatten.map(&:to_i)

      self.images = Image.where(:id => image_ids)
    end
  end
end
