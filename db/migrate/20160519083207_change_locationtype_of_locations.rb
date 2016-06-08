class ChangeLocationtypeOfLocations < ActiveRecord::Migration
  def change
  	change_column :locations, :location_type, :integer
  	change_column :locations, :district, :integer
  end
end
