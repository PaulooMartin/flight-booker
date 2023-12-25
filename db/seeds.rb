# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Airport.destroy_all

airport_codes = %w[MNL CEB ILO DVO CRK PPS CGY BCD TAC KLO ZAM TAG GES MPH]
airport_codes.each do |code|
  Airport.create!(iata_code: code)
end
