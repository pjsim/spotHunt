class RemoveLocationFromVenues < ActiveRecord::Migration
  def up
    remove_column :venues, :location
  end

  def down
    add_column :venues, :location, :string
  end
end
