require_dependency "blogocalypse/application_controller"

module Blogocalypse
  class ImagesController < ApplicationController
    before_filter :image,       :not  => [ :index ]
    before_filter :image_cell,  :only => [ :new, :show, :edit ]
    before_filter :images_cell, :only => [ :index ]

    def create
      unless @image.update_attributes(image_params)
        logger.info "image not created with params #{params.inspect} because #{@image.errors.inspect}"

        flash[:alert] = t("images.not_saved")
        return render :new
      end

      logger.info "image #{@image.inspect} created with params #{params.inspect}"
      after_image_save
    end

    def update
      unless @image.update_attributes(image_params)
        logger.info "unable to update image #{@image.inspect} with params #{image_params.inspect} because #{@image.errors.inspect}"

        flash[:alert] = t("images.not_saved")
        return render :edit
      end

      logger.info "image #{@image.inspect} updated with params #{params.inspect}"
      after_image_save
    end

    def destroy
      unless @image.destroy
        logger.error "unable to destroy image #{@image.inspect}"
        flash[:alert] = t("images.not_destroyed")

        return redirect_to image_path(@image)
      end

      logger.info "image #{@image.inspect} deleted"

      flash[:alert] = t("images.destroyed")
      return redirect_to images_path
    end

    protected

    def image_params
      params.require(:image).permit(:title, :body, :published_at, :tag_list)
    end

    def image
      if params[:id]
        @image ||= Image.find(params[:id]) || not_found
      else
        @image ||= Image.new
      end
    end

    def image_cell
      @image_cell ||= cell(Blogocalypse::Image, image)
    end

    def images_cell
      @images_cell ||= cell(Blogocalypse::Images)
    end

    def after_image_save
      flash[:info] = t("images.saved")
      return redirect_to image_path(:id => @image.slug)
    end
  end
end
