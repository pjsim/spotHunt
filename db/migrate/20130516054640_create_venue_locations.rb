class CreateVenueLocations < ActiveRecord::Migration
  def self.up
    create_table :venue_locations do |t|
      t.string :address
      t.float :latitude
      t.float :longitude
      t.boolean :gmaps
      t.timestamps
    end
  end

  def self.down
    drop_table :venue_locations
  end
end
