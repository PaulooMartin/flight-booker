class BookingsController < ApplicationController
  before_action :require_valid_params, only: :new

  def new
    @flight = Flight.find(params[:flight_id])
    @booking = @flight.bookings.new
    params[:passenger_count].to_i.times { |_i| @booking.passengers.new }
  end

  def create; end

  private

  def require_valid_params
    redirect_to(root_path, alert: 'Passenger count or Flight is invalid.') unless valid_booking_params?
  end

  def valid_booking_params?
    params[:passenger_count].to_i.between?(1, 4) && Flight.exists?(id: params[:flight_id])
  end
end
