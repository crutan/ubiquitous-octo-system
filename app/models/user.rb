class User < ApplicationRecord
  has_many :slideshows, dependent: :destroy
  has_many :presentations, dependent: :destroy
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
end
