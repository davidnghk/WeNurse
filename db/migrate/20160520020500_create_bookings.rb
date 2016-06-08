class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.references :user, index: true, foreign_key: true
      t.datetime :start_datetime
      t.datetime :end_datetime
      t.references :pickup_location, references: :locations, index: true
      t.references :dropoff_location, references: :locations, index: true
      t.integer :trip_type
      t.integer :helper_class
      t.integer :hourly_rate
      t.decimal :total_fee
      t.references :server, references: :users, index: true
      t.integer :status

      t.timestamps null: false
    end
  end
end
