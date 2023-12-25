class CreateFlights < ActiveRecord::Migration[7.1]
  def change
    create_table :flights do |t|
      t.references :departing_airport, foreign_key: {to_table: :airports}
      t.references :arriving_airport, foreign_key: {to_table: :airports}
      t.datetime :departure_date
      t.time :duration
      t.timestamps
    end
  end
end
