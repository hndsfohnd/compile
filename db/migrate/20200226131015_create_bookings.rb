class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.string :flight_class,               null: false
      t.string :country,             null: false
      t.date :departure_day,     null: false
      t.string :departure,           null: false
      t.string :destination,         null: false
      t.date :return_day,        null: false
      t.string :hotel,               null: false
      t.text :remarks
      t.text :policy
      t.string :airline
      t.string :flight_schedule
      t.string :flight_rate
      t.string :hotel_rate
      t.string :decision
      t.string :issue
      t.references :user, foreign_key: true
      t.references :estimate, foreign_key: true
      t.timestamps
    end
  end
end
