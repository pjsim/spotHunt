class VenuesController < ApplicationController
  # GET /venues
  # GET /venues.json

    # @venues = Venue.where(:user_id => current_user.id)

  def index

    @enquirers = Enquirer.all
    @venues = Venue.where(:user_id => current_user.id)
    if params[:search].present?
      @search_location = Venue.create(:address => params[:search])
      #@venues = Venue.near(params[:search], params[:radius], :order => :distance)
      @json = Venue.near(params[:search], params[:radius], :order => :distance).to_gmaps4rails
    else
      @venues = Venue.all
      @json = Venue.all.to_gmaps4rails
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @venues }
      if params[:search].present?
        @search_location.destroy
      end
    end
  end
  # # GET /venues/1
  # # GET /venues/1.json
  # def show
  #   @venue = Venue.find(params[:id])

  #   respond_to do |format|
  #     format.html # show.html.erb
  #     format.json { render json: @venue }
  #   end
  # end



  def show
    @venue = Venue.find(params[:id])
    @json = Venue.find(params[:id]).to_gmaps4rails

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @venue }
    end
  end

  # GET /venues/new
  # GET /venues/new.json
  def new
    @venue = Venue.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @venue }
    end
  end

  # GET /venues/1/edit
  def edit
    @venue = Venue.find(params[:id])
  end

  # POST /venues
  # POST /venues.json
  def create
    @venue = Venue.new(params[:venue])
    @venue.user_id = current_user.id

    respond_to do |format|
      if @venue.save
        format.html { redirect_to @venue, notice: 'Venue was successfully created.' }
        format.json { render json: @venue, status: :created, location: @venue }
      else
        format.html { render action: "new" }
        format.json { render json: @venue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /venues/1
  # PUT /venues/1.json
  def update
    @venue = Venue.find(params[:id])

    respond_to do |format|
      if @venue.update_attributes(params[:venue])
        format.html { redirect_to @venue, notice: 'Venue was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @venue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /venues/1
  # DELETE /venues/1.json
  def destroy
    @venue = Venue.find(params[:id])
    @venue.destroy

    respond_to do |format|
      format.html { redirect_to venues_url }
      format.json { head :no_content }
    end
  end
end
