class User < ApplicationRecord
  has_many :creations, dependent: :destroy
  has_many :events, through: :creations
  
  validates :name, presence: true
end
