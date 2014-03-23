module Blogocalypse
  class ImageCell < ViewModel
    include ActionView::Helpers::AssetTagHelper

    def show
      render
    end

    def pick
      render
    end

    def new
      @image = Blogocalypse::Image.new
      render
    end
  end
end
