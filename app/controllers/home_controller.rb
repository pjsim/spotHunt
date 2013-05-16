class HomeController < ApplicationController
  def index
    @users = User.all
    @venues = Venue.all
  end
end
