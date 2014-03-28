module Blogocalypse
  class CommentsCell < Cell::Rails
    include Cell::Rails::ViewModel

    def show
      return unless disqus_shortname

      render
    end

    def disqus_shortname
      Blogocalypse.disqus_shortname
    end

    def disqus_identifier
      return unless model

      "usb_post_#{model.id}"
    end
  end
end
