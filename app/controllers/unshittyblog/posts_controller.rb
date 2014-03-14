require_dependency "unshittyblog/application_controller"

module Unshittyblog
  class PostsController < ApplicationController
    def new
      @post = Post.new
    end

    def create
      unless @post = Post.create(post_params)
        logger.info "post not created with params #{params.inspect} because #{@post.errors.inspect}"

        add_to_flash :alert, t("posts.post_not_created")
        return render :new
      end
    end

    def index
      @posts_cell = cell(Unshittyblog::Posts, posts)
    end

    def show
      @post = post
    end

    def edit
      @post = post
    end

    def update
      @post = post

      unless @post.update_attributes(post_params)
        logger.info "unable to update post #{@post.inspect} with params #{post_params.inspect} because #{@post.errors.inspect}"

        add_to_flash :alert, t("posts.post_not_updated")
        return render :edit
      end
    end

    def destroy
      @post = post

      unless post.destroy
        logger.error "unable to destroy post #{@post.inspect}"
        add_to_flash :alert, t("posts.post_not_destroyed")

        return redirect_to post_path(@post)
      end
    end

    protected

    def post_params
      params.require(:post).permit(:title, :body, :published_at)
    end

    def post
      Post.find(params[:id]) || not_found
    end

    def posts
      Post.all
    end
  end
end
