class HomeController < ApplicationController
  def index
    @users = User.all
<<<<<<< HEAD
    @venues = Venue.all
    if params[:search].present?
      @search_location = VenueLocation.create(:address => params[:search])
      @venue_locations = VenueLocation.near(params[:search], params[:radius], :order => :distance)
      @json = VenueLocation.near(params[:search], params[:radius], :order => :distance).to_gmaps4rails
    else
      @venue_locations = VenueLocation.all
      @json = VenueLocation.all.to_gmaps4rails
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @venue_locations }
      if params[:search].present?
        @search_location.destroy
      end
    end
=======
>>>>>>> upstream/master
  end
end
