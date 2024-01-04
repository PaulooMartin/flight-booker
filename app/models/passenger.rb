class Passenger < ApplicationRecord
  validates_presence_of :name, :email

  belongs_to :booking
end
