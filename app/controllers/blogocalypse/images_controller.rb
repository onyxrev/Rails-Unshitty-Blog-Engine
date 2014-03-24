require_dependency "blogocalypse/application_controller"

module Blogocalypse
  class ImagesController < ApplicationController
    before_filter :image
    before_filter :authorize!

    def create
      unless @image.update_attributes(image_params)
        logger.info "image not created with params #{params.inspect} because #{@image.errors.inspect}"
        return render :status => :unprocessable_entity
      end

      logger.info "image #{@image.inspect} created with params #{params.inspect}"

      return render :content_type=>'text/html', :text => cell(Blogocalypse::Image, @image).pick, :layout => false
    end

    def destroy
      unless @image.destroy
        logger.error "unable to destroy image #{@image.inspect}"
        return redirect_to image_path(@image)
      end

      logger.info "image #{@image.inspect} deleted"

      return render :status => :no_content, :text => nil, :layout => false
    end

    protected

    def image_params
      params.require(:image).permit(:image)
    end

    def image
      if params[:id]
        @image ||= Image.find(params[:id]) || not_found
      else
        @image ||= Image.new
      end
    end

    def authorize!
      check_permissions @image, Image
    end
  end
end
