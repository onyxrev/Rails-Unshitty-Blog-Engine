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
      return @model if @model

      query = Post.all.order(:published_at => :desc)

      # if we've got a user, allow them to see unpublished posts
      unless host_user
        query = query.where("published_at IS NOT NULL and published_at >= ?", Time.now)
      end

      @model ||= model || query
    end
  end
end
