class Venue < ActiveRecord::Base
  attr_accessible :about, :email, :location, :manager, :name, :phone, 
  :website, :avatar, :tag_list, :address, :latitude, :longitude, :gmaps

  belongs_to :user

  has_one :venue_location

  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

  acts_as_gmappable

	def gmaps4rails_address
		address
	end

	
  acts_as_taggable
  acts_as_taggable_on :tags

  mount_uploader :avatar, AvatarUploader
end
