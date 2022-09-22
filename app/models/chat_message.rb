# frozen_string_literal: true

class ChatMessage < ApplicationRecord
  belongs_to :attendee
  belongs_to :presentation

  after_create_commit ->(message) { broadcast_append_later_to(message.presentation, 'chat_messages') }
  after_destroy_commit ->(message) { broadcast_remove_later_to(message.presentation, 'chat_messages') }
end
