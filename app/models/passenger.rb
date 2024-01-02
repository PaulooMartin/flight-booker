class Passenger < ApplicationRecord
  validates_presence_of :name, :email

  has_many :bookings
  has_many :flights, through: :bookings
end
