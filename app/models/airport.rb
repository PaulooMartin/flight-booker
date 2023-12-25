class Airport < ApplicationRecord
  validates_presence_of :iata_code

  has_many :departing_flights, class_name: "Flight", inverse_of: :departure_airport,
                              foreign_key: "departing_airport_id"
  has_many :arriving_flights, class_name: "Flight", inverse_of: :arrival_airport,
                              foreign_key: "arriving_airport_id"
end
