class AttendeesController < ApplicationController
  before_action :set_presentation

  def create
    @attendee = @presentation.attendees.build(user: current_user, name: current_user.name)
    if @attendee.save
      redirect_to presentation_path(@presentation)
    else
      Rails.logger.info "errors: #{@attendee.errors.full_messages}"
      redirect_to presentations_path, notice: 'Could not join presentation'
    end
  end

  def destroy
  end

  private
  
  def set_presentation
    @presentation = Presentation.find(params[:presentation_id])
  end
end
