module Unshittyblog
  class PostCell < ViewModel
    property :title
    property :body

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
  end
end
