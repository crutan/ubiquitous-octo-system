class User < ApplicationRecord
  has_many :slideshows, dependent: :destroy
  has_many :presentations, dependent: :destroy
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true

  def is_attending?(presentation)
    presentation.attendees.exists?(user_id: id)
  end
end
