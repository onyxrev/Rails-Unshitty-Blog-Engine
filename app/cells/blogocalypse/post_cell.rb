module Blogocalypse
  class PostCell < ViewModel
    property :title
    property :body

    def new
      render
    end

    def show(args = {})
      @post_is_the_page_subject = args[:post_is_the_page_subject] != false

      render
    end

    def edit
      render
    end

    def post_title
      render :partial => "title", :locals => { :model => model, :title => title, :post_is_the_page_subject => @post_is_the_page_subject }
    end

    def comments_cell
      @comments_cell ||= cell(Blogocalypse::Comments, model)
    end

    def tags_cell
      @tags_cell ||= cell(Blogocalypse::Tags, model)
    end

    def images_cell
      @images_cell ||= cell(Blogocalypse::Images, model.images)
    end

    def new_image_cell
      cell(Blogocalypse::Image, model.images.build)
    end

    def published_at
      return t("posts.unpublished") unless model.published_at

      model.published_at.strftime(Blogocalypse.date_format)
    end
  end
end
