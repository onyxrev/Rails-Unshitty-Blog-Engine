module Blogocalypse
  class PostsCell < ViewModel
    def initialize(*args)
      super(*args)

      @post_cells = post_cells
    end

    def show
      render
    end

    def posts
      @model ||= model
    end

    protected

    def post_cells
      @post_cells ||= posts.map do |p|
        cell(Blogocalypse::Post, p)
      end
    end
  end
end
