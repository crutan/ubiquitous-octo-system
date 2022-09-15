module My
  class SlidesController < ApplicationController
    before_action :set_presentation
    before_action :set_slide, only: [:show, :edit, :update, :destroy, :move]
    

    def index
      @slides = @presentation.slides
    end

    def show
    end

    def new
      @slide = @presentation.slides.build(slide_params)
    end

    def edit
    end

    def update
      if @slide.update(slide_params)
        respond_to do |format|
          format.html { redirect_to my_presentation_slide_path(@presentation, @slide), notice: 'Slide successfully updated' }
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
      @slide = @presentation.slides.build(slide_params)
      if @slide.save
        respond_to do |format|
          format.html { redirect_to my_presentation_slide_path(@presentation, @slide), notice: 'Slide successfully created' }
          format.turbo_stream
        end
      else
        render :new, status: :unprocessable_entity
      end
    end

    def destroy
      @slide.destroy
      respond_to do |format|
        format.html { redirect_to my_presentation_slide_path(@presentation, @slide), notice: 'Slide successfully removed' }
        format.turbo_stream
      end
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