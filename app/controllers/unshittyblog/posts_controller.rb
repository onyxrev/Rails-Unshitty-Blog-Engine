require_dependency "unshittyblog/application_controller"

module Unshittyblog
  class PostsController < ApplicationController
    before_filter :post,       :not  => [ :index ]
    before_filter :post_cell,  :only => [ :new, :show, :edit ]
    before_filter :posts_cell, :only => [ :index ]

    def create
      unless @post.update_attributes(post_params)
        logger.info "post not created with params #{params.inspect} because #{@post.errors.inspect}"

        flash[:alert] = t("posts.not_saved")
        return render :new
      end

      logger.info "post #{@post.inspect} created with params #{params.inspect}"
      after_post_save
    end

    def update
      unless @post.update_attributes(post_params)
        logger.info "unable to update post #{@post.inspect} with params #{post_params.inspect} because #{@post.errors.inspect}"

        flash[:alert] = t("posts.not_saved")
        return render :edit
      end

      logger.info "post #{@post.inspect} updated with params #{params.inspect}"
      after_post_save
    end

    def destroy
      unless @post.destroy
        logger.error "unable to destroy post #{@post.inspect}"
        flash[:alert] = t("posts.not_destroyed")

        return redirect_to post_path(@post)
      end

      logger.info "post #{@post.inspect} deleted"

      flash[:alert] = t("posts.destroyed")
      return redirect_to posts_path
    end

    protected

    def post_params
      params.require(:post).permit(:title, :body, :published_at)
    end

    def post
      if params[:id]
        @post ||= Post.friendly.find(params[:id]) || not_found
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

    def after_post_save
      flash[:info] = t("posts.saved")
      return redirect_to post_path(:id => @post.slug)
    end
  end
end
