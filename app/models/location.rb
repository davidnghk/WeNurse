class Location < ActiveRecord::Base
  has_many :pickup_location, :class_name => 'Booking', :foreign_key => 'pickup_location_id' 
  has_many :dropoff_location, :class_name => 'Booking', :foreign_key => 'dropoff_location_id' 

  enum district: [:中西區, :東區, :南區, :灣仔, :深水埗, :九龍城, :觀塘, :黃大仙, 
  	:油尖旺, :離島, :葵青, :北區, :西貢, :沙田, :大埔, :荃灣, :屯門, :元朗]
  enum location_type: [:Hospital, :Home]

  belongs_to :user

	def full_name #to_label
		"#{user.name} #{name} #{district} #{address_1} #{address_2}" 
	end

end
