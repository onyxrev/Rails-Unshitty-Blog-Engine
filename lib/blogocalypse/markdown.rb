module Blogocalypse
  class Markdown < Redcarpet::Render::HTML
    include ActionView::Helpers::AssetTagHelper

    def preprocess(text)
      render_images(text)
    end

    def render_images(text)
      text.gsub(/\!\[(.*)\]\(id\:([0-9]+)(.*)?\)(\<(.*)\>)?/) do |parts|
        alt        = $1
        id         = $2
        title      = $3
        dimensions = $5.present? ? $5 : Blogocalypse.default_image_size

        begin
          image = Blogocalypse::Image.find(id)
          image_tag image.image.thumb(dimensions).url, :class => "usb-image-thumbnail", :alt => alt, :title => title
        rescue
          "\"#{alt}\""
        end
      end
    end
  end
end
