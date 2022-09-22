# frozen_string_literal: true

class Slideshow < ApplicationRecord
  has_many :slides, -> { order(position: :asc) }, dependent: :destroy
  belongs_to :user
end
