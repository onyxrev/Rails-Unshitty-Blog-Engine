require_dependency "unshittyblog/application_controller"

module Unshittyblog
  class PostsController < ApplicationController
    before_filter :post,       :not  => [ :index ]
    before_filter :post_cell,  :only => [ :show, :edit ]
    before_filter :posts_cell, :only => [ :index ]

    def create
      unless @post.update_attributes(post_params)
        logger.info "post not created with params #{params.inspect} because #{@post.errors.inspect}"

        add_to_flash :alert, t("posts.post_not_created")
        return render :new
      end
    end

    def update
      unless @post.update_attributes(post_params)
        logger.info "unable to update post #{@post.inspect} with params #{post_params.inspect} because #{@post.errors.inspect}"

        add_to_flash :alert, t("posts.post_not_updated")
        return render :edit
      end
    end

    def destroy
      unless @post.destroy
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
      if params[:id]
        @post ||= Post.find(params[:id]) || not_found
      else
        @post ||= Post.new
      end
    end

    def post_cell
      @post_cell ||= cell(Unshittyblog::Post, post)
    end

    def posts_cell
      @posts_cell ||= cell(Unshittyblog::Posts)
    end
  end
end
