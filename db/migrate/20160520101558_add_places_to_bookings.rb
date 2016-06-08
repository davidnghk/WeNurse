class AddPlacesToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :pickup_address, :string
    add_column :bookings, :dropoff_address, :string
  end
end
