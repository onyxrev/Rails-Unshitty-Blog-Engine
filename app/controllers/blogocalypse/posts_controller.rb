require_dependency "blogocalypse/application_controller"

module Blogocalypse
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
      return after_post_save
    end

    def update
      unless @post.update_attributes(post_params)
        logger.info "unable to update post #{@post.inspect} with params #{post_params.inspect} because #{@post.errors.inspect}"

        flash[:alert] = t("posts.not_saved")
        return render :edit
      end

      logger.info "post #{@post.inspect} updated with params #{params.inspect}"
      return after_post_save
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
      params.require(:post).permit(:title, :body, :published_at, :tag_list, :images_attributes => [ :image, :alt, :title ])
    end

    def post
      if params[:id]
        @post ||= Post.friendly.find(params[:id]) || not_found
      else
        @post ||= Post.new
      end
    end

    def post_cell
      @post_cell ||= cell(Blogocalypse::Post, post)
    end

    def posts_cell
      @posts_cell ||= cell(Blogocalypse::Posts)
    end

    def after_image_upload
      return render :content_type=>'text/html', :text => cell(Blogocalypse::Image, @post.images.last).pick, :layout => false
    end

    def after_post_save
      return after_image_upload if post_params[:images_attributes]

      flash[:info] = t("posts.saved")

      return redirect_to edit_post_path(:id => @post.slug) if params[:return_to] == "edit"
      return redirect_to post_path(:id => @post.slug)
    end
  end
end
