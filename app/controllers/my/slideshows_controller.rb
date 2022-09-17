module My
  class SlideshowsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_slideshow, only: [:show, :edit, :update, :destroy]
    
    def index
      @slideshows = current_user.slideshows
    end

    def show
    end

    def edit
    end

    def new
      @slideshow = Slideshow.new
    end

    def create
      @slideshow = Slideshow.new(slideshow_params)
      if @slideshow.save
        redirect_to my_slideshow_path(@slideshow), notice: 'Slideshow created successfully'
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      if @slideshow.update(slideshow_params)
        redirect_to my_slideshow_path(@slideshow), notice: 'Slideshow updated successfully'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @slideshow.destroy
      redirect_to my_slideshows_path, notice: 'Slideshow successfully removed'
    end

    private
    
    def set_slideshow
      @slideshow = Slideshow.find(params[:id])
    end

    def slideshow_params
      params.require(:slideshow).permit(:name, :description)
    end
  end
end
