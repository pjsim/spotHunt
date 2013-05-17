class EnquirersController < ApplicationController
  before_filter :authenticate_user!, :except => [:new, :create]
  # GET /enquirers
  # GET /enquirers.json
  def index
    @enquirers = Enquirer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @enquirers }
    end
  end

  # GET /enquirers/1
  # GET /enquirers/1.json
  def show
    @enquirer = Enquirer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @enquirer }
    end
  end

  # GET /enquirers/new
  # GET /enquirers/new.json
  def new
    @enquirer = Enquirer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @enquirer }
    end
  end

  # GET /enquirers/1/edit
  #def edit
    #@enquirer = Enquirer.find(params[:id])
  #end

  # POST /enquirers
  # POST /enquirers.json
  def create
    @enquirer = Enquirer.new(params[:enquirer])
    @venue = Venue.find(params[:venue_id])
    respond_to do |format|
      if @enquirer.save

        EnquiryMailer.enquiry_email(@enquirer).deliver

        format.html { redirect_to @venue, notice: 'Thank you! Your message has been sent.' }
        format.json { render json: @enquirer, status: :created, location: @enquirer }
      else
        format.html { render action: "new" }
        format.json { render json: @enquirer.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /enquirers/1
  # DELETE /enquirers/1.json
  def destroy
    @enquirer = Enquirer.find(params[:id])
    @enquirer.destroy

    respond_to do |format|
      format.html { redirect_to enquirers_url }
      format.json { head :no_content }
    end
  end
end
