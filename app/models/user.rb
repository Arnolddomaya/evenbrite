class User < ApplicationRecord
  has_many :creations
  has_many :events, through: :creations
end
