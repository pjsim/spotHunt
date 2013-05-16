class Venue < ActiveRecord::Base
  attr_accessible :about, :email, :location, :manager, :name, :phone, :website, :avatar, :tag_list

  belongs_to :user

  has_one :venue_location

  acts_as_taggable
  acts_as_taggable_on :tags

  mount_uploader :avatar, AvatarUploader
end
