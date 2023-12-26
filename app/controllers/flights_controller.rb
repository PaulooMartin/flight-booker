class FlightsController < ApplicationController
  def index
    @airport_options = Airport.all.map { |a| a.iata_code }
    @available_departure_dates = Flight.all.order(:departure_date).map do |f|
      [f.departure_date.strftime("%b %e %Y,%l:%M %p %Z"), f.departure_date.to_fs(:iso8601)]
    end
  end
end
