module My
  class PresentationsController < ApplicationController
    before_action :set_presentation, only: [:show, :edit, :update, :destroy]
    
    def show
      @chat_message = @presentation.chat_messages.build(attendee: @presentation.attendees.find_by(user_id: current_user.id))
    end

    def new
      @presentation = current_user.presentations.new
      @presentation.slideshow_id = params[:slideshow][:id] if params[:slideshow]
    end

    def create
      @presentation = Presentation.new(presentation_params.merge(user: current_user))
      @presentation.slide = @presentation.slideshow.slides.first
      if @presentation.save
        redirect_to my_presentation_path(@presentation), notice: 'Presentation created successfully'
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      if @presentation.update(presentation_params)
        respond_to do |format|
          format.html { redirect_to my_presentation_path(@presentation), notice: 'Presentation updated successfully' }
          format.turbo_stream
        end
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
      params.require(:presentation).permit(:name, :slideshow_id, :slide_id)
    end
  end
end