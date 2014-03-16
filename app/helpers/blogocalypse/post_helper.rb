module Blogocalypse
  module PostHelper
    def post_title
      tag = @posts.blank? ? "h1" : "h2"

      render :partial => "_title", :locals => { :tag => tag, :title => @post.title }
    end
  end
end
