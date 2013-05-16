class VenueLocation < ActiveRecord::Base
  attr_accessible :address, :latitude, :longitude, :gmaps

  belongs_to :venue

  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

  acts_as_gmappable

	def gmaps4rails_address
		address
	end

end
