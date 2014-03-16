module Unshittyblog
  class PostsCell < BaseCell
    include Cell::Rails::ViewModel

    def show
      @post_cells = posts.map do |p|
        cell(Unshittyblog::Post, p)
      end

      render
    end

    protected

    def posts
      @model ||= model || Post.all
    end
  end
end
