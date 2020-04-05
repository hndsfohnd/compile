class CreateEstimates < ActiveRecord::Migration[5.2]
  def change
    create_table :estimates do |t|
      t.string :class,               null: false
      t.string :country,             null: false
      t.datetime :departure_day,     null: false
      t.string :departure,           null: false
      t.string :destination,         null: false
      t.datetime :return_day,        null: false
      t.string :hotel,               null: false
      t.text :remarks
      t.text :policy
      t.string :airline
      t.string :flight_schedule
      t.string :flight_rate
      t.string :hotel_rate
      t.string :decision
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
