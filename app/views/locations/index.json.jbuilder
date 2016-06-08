json.array!(@locations) do |location|
  json.extract! location, :id, :name, :location_type, :district, :address_1, :address_2, :user_id
  json.url location_url(location, format: :json)
end
