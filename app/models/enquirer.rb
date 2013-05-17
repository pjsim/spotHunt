class Enquirer < ActiveRecord::Base
  attr_accessible :email, :message, :name

  validates :name, :presence => true
  validates :email, :presence => true
  validates :message, :presence => true
end
