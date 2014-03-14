module Unshittyblog
  class PostCell < ViewModelForm
    property :title
    property :body

    def show(args)
      @post_is_the_page_subject = args[:post_is_the_page_subject]

      render
    end

    def edit
      render
    end

    def post_title
      render :partial => "title", :locals => { :title => title, :post_is_the_page_subject => @post_is_the_page_subject }
    end
  end
end
