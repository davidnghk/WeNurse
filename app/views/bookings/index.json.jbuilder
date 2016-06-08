json.array!(@bookings) do |booking|
  json.extract! booking, :id, :user_id, :start_datetime, :hours, :pickup_address, :dropoff_address, :trip_type, :helper_class, :total_fee, :server_id, :status
  json.url booking_url(booking, format: :json)
end
