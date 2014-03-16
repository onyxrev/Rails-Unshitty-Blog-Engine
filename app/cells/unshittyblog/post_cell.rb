module Unshittyblog
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
      @comments_cell ||= cell(Unshittyblog::Comments, model)
    end

    def tags_cell
      @tags_cell ||= cell(Unshittyblog::Tags, model)
    end

    def published_at
      model.published_at.strftime(Unshittyblog.date_format)
    end
  end
end
