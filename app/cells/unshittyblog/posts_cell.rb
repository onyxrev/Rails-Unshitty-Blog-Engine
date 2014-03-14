module Unshittyblog
  class PostsCell < Cell::Rails
    include Cell::Rails::ViewModel

    property :posts

    def show
      @post_cells = posts.map do |p|
        cell(Unshittyblog::Post, p)
      end

      render
    end
  end
end
