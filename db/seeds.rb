# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
def rand_pick(max)
  Random.rand(max)
end

Airport.destroy_all
airport_codes = %w[MNL CEB ILO DVO CRK PPS CGY BCD TAC KLO ZAM TAG GES MPH]
airport_codes.each { |code| Airport.create!(iata_code: code)}

Flight.destroy_all
10.times do |_i|
  flight_data = {
    duration: rand_pick(86400),
    departure_date: DateTime.current.change(day: rand_pick(30) + 1, hour: rand_pick(23))
  }
  new_flight = Flight.find_or_initialize_by(flight_data)
  new_flight.departure_airport = Airport.find_by(iata_code: airport_codes.sample)
  new_flight.arrival_airport = Airport.find_by(iata_code: airport_codes.sample)
  new_flight.save!
end
