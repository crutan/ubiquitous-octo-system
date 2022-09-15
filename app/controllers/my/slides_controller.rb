module My
  class SlidesController < ApplicationController
    before_action :set_presentation
    before_action :set_slide, only: [:show, :edit, :update, :destroy]
    

    def index
      @slides = @presentation.slides
    end

    def show
    end

    def new
      @slide = @presentation.slides.build
    end

    def edit
    end

    def update
      if @slide.update(slide_params)
        redirect_to my_presentation_slide_path(@presentation, @slide), notice: 'Slide successfully updated'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def create
      @slide = @presentation.slides.build(slide_params)
      if @slide.save
        redirect_to presentation_path(@presentation), notice: 'Slide successfully created'
      else
        render :new, status: :unprocessable_entity
      end
    end

    def destroy
      @slide.destroy
      redirect_to presentation_path(@presentation), notice: 'Slide successfully removed'
    end

    private

    def set_presentation
      @presentation = Presentation.find(params[:presentation_id])
    end

    def set_slide
      @slide = @presentation.slides.find(params[:id])
    end

    def slide_params
      params.require(:slide).permit(:name, :position, :body)
    end

  end
end