require_dependency "blogocalypse/application_controller"

module Blogocalypse
  class ImagesController < ApplicationController
    before_filter :image

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
      params.require(:image).permit(:id)
    end

    def image
      @image ||= Image.find(params[:id]) || not_found
    end
  end
end
