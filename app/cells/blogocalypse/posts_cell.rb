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
      @model ||= (model || get_posts)
    end

    private

    def page
      @args[:page]
    end

    def get_posts
      query = Post.all.order(:published_at => :desc).page(page).per(Blogocalypse.pagination_count)

      # if we've got a user, allow them to see unpublished posts
      unless host_user
        query = query.where("published_at IS NOT NULL and published_at >= ?", Time.now)
      end

      query
    end
  end
end
