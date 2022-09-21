class PresentationsController < ApplicationController
  before_action :set_presentation, only: [ :show, :update ]
  before_action :set_attendee, only: [ :show ]

  def index
    @presentations = Presentation.all
  end

  def show
    @chat_message = @presentation.chat_messages.build(attendee: @attendee)
  end

  private

  def set_presentation
    @presentation = Presentation.find(params[:id])
  end

  def set_attendee
    @attendee = @presentation.attendees.where(user_id: current_user.id).first_or_create
  end

end
