module Blogocalypse
  class PostsCell < ViewModel
    def show
      render
    end

    def post_cells
      posts.map do |p|
        cell(Blogocalypse::Post, p)
      end
    end

    def posts
      @model ||= model
    end
  end
end
