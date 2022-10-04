class User < ApplicationRecord
  has_many :reservations
  has_many :transports, through: :reservations
end
