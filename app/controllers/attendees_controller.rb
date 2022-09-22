# frozen_string_literal: true

class AttendeesController < ApplicationController
  before_action :set_presentation
  before_action :set_attendee, only: %i[update destroy]

  def create
    @attendee = @presentation.attendees.build(user: current_user, name: current_user.name, active: true)
    if @attendee.save
      redirect_to presentation_path(@presentation)
    else
      Rails.logger.info "errors: #{@attendee.errors.full_messages}"
      redirect_to presentations_path, notice: 'Could not join presentation'
    end
  end

  def update
    if @attendee.update(attendee_params)
      redirect_to @attendee.active? ? presentation_path(@presentation) : root_path
    else
      redirect_to presentaion_path(@presentation)
    end
  end

  def destroy
    @attendee.destroy
    redirect_to root_path
  end

  private

  def attendee_params
    params.require(:attendee).permit(:name, :active)
  end

  def set_presentation
    @presentation = Presentation.find(params[:presentation_id])
  end

  def set_attendee
    @attendee = @presentation.attendees.find(params[:id])
  end
end
