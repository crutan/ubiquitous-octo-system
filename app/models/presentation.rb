# frozen_string_literal: true

class Presentation < ApplicationRecord
  belongs_to :slideshow
  belongs_to :slide
  has_many :attendees, dependent: :destroy
  belongs_to :user
  has_many :chat_messages, -> { order(created_at: :asc) }, dependent: :destroy

  scope :active, -> { where(active: true) }

  after_create :add_presenter_as_attendee
  after_update_commit :render_current_slide

  private

  def add_presenter_as_attendee
    attendees.create(user_id: user_id, name: user.name, presenter: true)
  end

  def render_current_slide
    return unless saved_change_to_slide_id?

    broadcast_replace_to([self, 'current_slide'], target: 'current_slide', partial: 'presentations/current_slide', locals: { presentation: self, slide: slide })
  end
end
