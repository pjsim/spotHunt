class HomeController < ApplicationController
  def index
    @users = User.all

    # @venues = Venue.all
    # if params[:search].present?
    #   @search_location = Venue.create(:address => params[:search])
    #   @venue_locations = Venue.near(params[:search], 5, :order => :distance)
    #   @json = Venue.near(params[:search], 5, :order => :distance).to_gmaps4rails
    # else
    #   @venue_locations = Venue.all
    #   @json = Venue.all.to_gmaps4rails
    # end

    # respond_to do |format|
    #   format.html # index.html.erb
    #   format.json { render json: @venue_locations }
    #   if params[:search].present?
    #     @search_location.destroy
    #   end
    # end
  end
end
