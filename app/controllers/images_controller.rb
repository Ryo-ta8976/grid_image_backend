class ImagesController < ApplicationController
    before_action :set_image, only: %i[destroy]

    def index
        images = Image.all.order(:id)
        render json: images
    end

    def create
        image = Image.new(post_params)
        if image.save
            render json: image
        else
            render json: image.errors
        end
    end

    def destroy
        if @image.destroy
            render json: @image
        else
            render json: @image.errors
        end
    end

    private

    def set_image
        @image = Image.find(params[:id])
    end

    def post_params
        params.require(:params).permit(:label, :url)
    end
end