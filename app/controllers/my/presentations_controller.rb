module My
  class PresentationsController < ApplicationController
    before_action :set_presentation, only: [:show, :edit, :update, :destroy]
    
    def show
    end

    def new
      @presentation = current_user.presentations.new
      @presentation.slideshow_id = params[:slideshow][:id] if params[:slideshow]
    end

    def create
      @presentation.new(presentation_params)
      if @presentation.save
        redirect_to my_presentation_path(@presentation), notice: 'Presentation created successfully'
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      if @presentation.update(presentation_params)
        redirect_to my_presentation_path(@presentation), notice: 'Presentation updated successfully'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @presentation.destroy
      redirect_to my_presentations_path, notice: 'Presentation successfully removed'
    end

    private
    
    def set_presentation
      @presentation = current_user.presentations.find(params[:id])
    end

    def presentation_params
      params.require(:presentation).permit(:name, :description, :viewing, :viewing_slide_id)
    end
  end
end