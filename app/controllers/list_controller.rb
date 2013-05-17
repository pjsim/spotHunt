class ListController < ApplicationController
  def index
  	@venues = Venue.all
  end
end
