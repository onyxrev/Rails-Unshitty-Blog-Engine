require_dependency "blogocalypse/application_controller"

module Blogocalypse
  class PostTagsController < ApplicationController
    before_filter :tags,       :only => [ :index ]
    before_filter :tags_cell,  :only => [ :index ]
    before_filter :posts,      :only => [ :show ]
    before_filter :posts_cell, :only => [ :show ]

    protected

    def tags
      @tags ||= Post.tag_counts.order(:name).all
    end

    def tags_cell
      @tags_cell ||= cell(Blogocalypse::Tags, tags)
    end

    def tag
      @tag ||= params[:id]
    end

    def posts
      return @posts if @posts

      query = Post.tagged_with(tag).order(:published_at => :desc, :created_at => :desc).page(params[:page]).per(Blogocalypse.pagination_count)

      unless Blogocalypse.can.call host_user, :manage, Post
        query = query.where("published_at IS NOT NULL and published_at <= ?", Time.now)
      end

      @posts = query
    end

    def posts_cell
      @posts_cell ||= cell(Blogocalypse::Posts, posts)
    end
  end
end
