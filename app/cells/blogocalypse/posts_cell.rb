module Blogocalypse
  class PostsCell < ViewModel
    def initialize(*args)
      super(*args)
      @args  = {}
    end

    def show(args = {})
      @args = args

      @post_cells = posts.map do |p|
        cell(Blogocalypse::Post, p)
      end

      render
    end

    def posts
      @model ||= model
    end
  end
end
