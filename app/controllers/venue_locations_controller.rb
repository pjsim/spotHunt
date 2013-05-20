class VenueLocationsController < ApplicationController

  def index
    @venue_locations = VenueLocation.all
    if params[:search].present?

      @venues = Venue.near(params[:search], params[:radius], :order => :distance)
      # @json = Venue.near(params[:search], params[:radius], :order => :distance).to_gmaps4rails

      @jsonORIG = Venue.near(params[:search], params[:radius], :order => :distance).to_gmaps4rails do |venue, marker|
        marker.infowindow render_to_string(:partial => "/venue_locations/infowindow", :locals => { :venue => venue})
        marker.title   "i'm the title"
      end

      @venueFirst = Venue.first

      @venuesAll = Venue.all

      @myArray = Array.new

      @search_location = Venue.create(:address => params[:search])

      @venuesAll.each do |venue|
       @myA = @myArray.push(@search_location.distance_from(venue)) if @search_location.distance_from(venue) != 0.0
      end
      
      @myAI = @myA.index(@myA.min)

      @closestVenueName = @venuesAll[@myAI].name
      @closestVenueAddress = @venuesAll[@myAI].address

      @search_location.destroy

      @json = Venue.near(@closestVenueAddress, 5, :order => :distance).to_gmaps4rails do |venue, marker|
        marker.infowindow render_to_string(:partial => "/venue_locations/infowindow", :locals => { :venue => venue})
        marker.title   "click me for info"
        # marker.picture({
        #   :picture => "http://www.blankdots.com/img/github-32x32.png",
        #   :width   => 32,
        #   :height  => 32
        #  })
      end

    else
      @venues = Venue.all
      # @json = Venue.all.to_gmaps4rails
      @json = Venue.all.to_gmaps4rails do |venue, marker|
      marker.infowindow render_to_string(:partial => "/venue_locations/infowindow", :locals => { :venue => venue})
      marker.title   "i'm the title"
      # marker.json({ :id => user.id, :foo => "bar" })
      end
      @json_all = @json
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @venues }
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
