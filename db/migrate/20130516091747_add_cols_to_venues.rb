class AddColsToVenues < ActiveRecord::Migration
  def change
    add_column :venues, :address, :string
    add_column :venues, :latitude, :float
    add_column :venues, :longitude, :float
    add_column :venues, :gmaps, :boolean
  end
end
