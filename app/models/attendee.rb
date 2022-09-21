class Attendee < ApplicationRecord
  belongs_to :presentation
  has_many :chat_messages, dependent: :destroy
  belongs_to :user
  
  after_create :joined_chat_message
  after_update_commit :left_chat_message
  
  def activate!
    update!(active: true)
    joined_chat_message
  end

  private

  def joined_chat_message
    return unless active?

    chat_messages.create(presentation: presentation, text: " has joined the chat")
  end

  def left_chat_message
    return if active?
    return unless saved_change_to_active?

    chat_messages.create(presentation: presentation, text: "has left the chat")
  end
end
