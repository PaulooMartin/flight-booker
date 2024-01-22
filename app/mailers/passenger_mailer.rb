class PassengerMailer < ApplicationMailer
  default from: 'notifications@flightbooker.com'

  def confirmation_email
    @passenger = params[:passenger]
    @booking = params[:booking]
    @flight = @booking.flight
    mail(to: @passenger.email, subject: 'You have booked your flight')
  end
end
