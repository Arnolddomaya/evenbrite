class Event < ApplicationRecord
  has_many :registrations, dependent: :destroy
  has_many :users, through: :registrations

  validates :date, presence: true
  validates :description, presence: true
end
