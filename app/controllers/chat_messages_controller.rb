# frozen_string_literal: true

class ChatMessagesController < ApplicationController
  before_action :set_presentation
  before_action :set_attendee

  def create
    @chat_message = @presentation.chat_messages.build(chat_message_params.merge(attendee: @attendee))
    @chat_message.save
    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end

  private

  def chat_message_params
    params.require(:chat_message).permit(:text)
  end

  def set_presentation
    @presentation = Presentation.find(params[:presentation_id])
  end

  def set_attendee
    @attendee = @presentation.attendees.find_by(user: current_user)
  end
end
