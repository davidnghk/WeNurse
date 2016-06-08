class AddHoursToBookings < ActiveRecord::Migration
  def change
  	add_column :bookings, :hours, :integer, :null => false, :default => 2 
  end
end
