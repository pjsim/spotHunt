class VenueLocationsController < ApplicationController
  def index
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
  end

  def show
    @venue_location = VenueLocation.find(params[:id])
    @json = VenueLocation.find(params[:id]).to_gmaps4rails

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @venue_locations }
    end
  end

  def new
    @venue_location = VenueLocation.new
  end

  def create
    @venue_location = VenueLocation.new(params[:venue_location])
    if @venue_location.save
      redirect_to @venue_location, :notice => "Successfully created venue location."
    else
      render :action => 'new'
    end
  end

  def edit
    @venue_location = VenueLocation.find(params[:id])
  end

  def update
    @venue_location = VenueLocation.find(params[:id])
    if @venue_location.update_attributes(params[:venue_location])
      redirect_to @venue_location, :notice  => "Successfully updated venue location."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @venue_location = VenueLocation.find(params[:id])
    @venue_location.destroy
    redirect_to venue_locations_url, :notice => "Successfully destroyed venue location."
  end
end
