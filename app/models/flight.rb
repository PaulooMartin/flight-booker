class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: "Airport", inverse_of: :departing_flights,
                                foreign_key: "departing_airport_id"
  belongs_to :arrival_airport, class_name: "Airport", inverse_of: :arriving_flights,
                                foreign_key: "arriving_airport_id"
end
