module Blogocalypse
  class Markdown < Redcarpet::Render::HTML
    include ActionView::Helpers::AssetTagHelper

    def postprocess(text)
      render_images(text)
    end

    def render_images(text)
      text.gsub(/image_id:([0-9]*)/) do |parts|
        id = $1
        dimensions = Blogocalypse.default_image_size

        begin
          image = Blogocalypse::Image.find(id)
          image.image.thumb(dimensions).url
        rescue
        end
      end
    end
  end
end
