module Blogocalypse
  class ImagesCell < ViewModel
    def pick
      render
    end

    def image_cells
       persisted_images.map do |i|
        cell(Blogocalypse::Image, i)
      end
    end

    private

    def persisted_images
      model.select{ |i| i.persisted? }
    end
  end
end
