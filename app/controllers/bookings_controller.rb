class BookingsController < ApplicationController
  before_action :require_valid_search_params, only: :new

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Flight.find(params[:flight_id]).bookings.new
    params[:passenger_count].to_i.times { |_i| @booking.passengers.new }
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      redirect_to @booking
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: %i[name email])
  end

  def require_valid_search_params
    redirect_to(root_path, alert: 'Passenger count or Flight is invalid.') unless valid_search_params?
  end

  def valid_search_params?
    params[:passenger_count].to_i.between?(1, 4) && Flight.exists?(id: params[:flight_id])
  end
end
