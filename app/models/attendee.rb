class Attendee < ApplicationRecord
  belongs_to :presentation
  has_many :chat_messages, dependent: :destroy
  belongs_to :user
  
  after_create :joined_chat_message
  
  private

  def joined_chat_message
    chat_messages.create(presentation: presentation, text: " has joined the chat")
  end
end
