class AddAssociationsToBooking < ActiveRecord::Migration[7.1]
  def change
    add_belongs_to(:bookings, :flight)
  end
end
