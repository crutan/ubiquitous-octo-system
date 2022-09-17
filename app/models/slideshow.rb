class Slideshow < ApplicationRecord
  has_many :slides, -> {order(position: :asc)}, dependent: :destroy
  belongs_to :user
  
end
