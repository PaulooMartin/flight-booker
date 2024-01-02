class FlightsController < ApplicationController
  def index
    # Variables for search-form
    @airport_options = Airport.all.map(&:iata_code)
    @available_departure_dates = Flight.all.order(:departure_date).map do |f|
      [f.departure_date.strftime('%b %e %Y,%l:%M %p %Z'), f.departure_date.to_fs(:iso8601)]
    end

    # Variables for search-results
    @chosen_flights = Flight.where(flight_search_data)
  end

  private

  def flight_search_data
    {
      departing_airport_id: Airport.find_by(iata_code: params[:departure_airport]),
      arriving_airport_id: Airport.find_by(iata_code: params[:arrival_airport]),
      departure_date: params[:departure_date]
    }
  end
end
