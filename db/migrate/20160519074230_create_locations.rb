class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :Name
      t.string :location_type, :default => 2 
      t.string :district
      t.string :address_1
      t.string :address_2
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
