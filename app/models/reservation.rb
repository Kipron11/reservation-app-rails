class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :transport

  validates :time, presence: true
end
