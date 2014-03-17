module Blogocalypse
  class ImageCell < ViewModel
    include ActionView::Helpers::AssetTagHelper

    def show
      render
    end

    def pick
      render
    end

    def create(args = {})
      return unless @subject = args[:subject]

      render
    end

    def subject_url
      @router.send("#{subject_model_name}_path", { :id => @subject.slug, :return_to => :edit })
    end

    def subject_model_name
      return unless @subject

      @subject.class.name.gsub("Blogocalypse::", "").downcase
    end
  end
end
