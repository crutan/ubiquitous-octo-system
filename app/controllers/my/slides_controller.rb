module My
  class SlidesController < ApplicationController
    before_action :set_slideshow
    before_action :set_slide, only: [:show, :edit, :update, :destroy, :move]
    

    def index
      @slides = @slideshow.slides
    end

    def show
    end

    def new
      @slide = @slideshow.slides.build
      @slide.position = params[:slide][:position] if params[:slide]
    end

    def edit
    end

    def update
      if @slide.update(slide_params)
        respond_to do |format|
          format.html { redirect_to my_lideshow_slide_path(@slideshow, @slide), notice: 'Slide successfully updated' }
          format.turbo_stream
        end
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def move
      @slide.update(slide_params)
      head :ok
    end

    def create
      @slide = @slideshow.slides.build(slide_params)
      if @slide.save
        respond_to do |format|
          format.html { redirect_to my_slideshow_slide_path(@slideshow, @slide), notice: 'Slide successfully created' }
          format.turbo_stream
        end
      else
        render :new, status: :unprocessable_entity
      end
    end

    def destroy
      @slide.destroy
      respond_to do |format|
        format.html { redirect_to my_slideshow_slide_path(@slideshow, @slide), notice: 'Slide successfully removed' }
        format.turbo_stream
      end
    end

    private

    def set_slideshow
      @slideshow = Slideshow.find(params[:slideshow_id])
    end

    def set_slide
      @slide = @slideshow.slides.find(params[:id])
    end

    def slide_params
      params.require(:slide).permit(:name, :position, :body, :notes)
    end
  end
end