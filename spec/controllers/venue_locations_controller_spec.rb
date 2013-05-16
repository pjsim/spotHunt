require File.dirname(__FILE__) + '/../spec_helper'

describe VenueLocationsController do
  fixtures :all
  render_views

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end

  it "show action should render show template" do
    get :show, :id => VenueLocation.first
    response.should render_template(:show)
  end

  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end

  it "create action should render new template when model is invalid" do
    VenueLocation.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    VenueLocation.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(venue_location_url(assigns[:venue_location]))
  end

  it "edit action should render edit template" do
    get :edit, :id => VenueLocation.first
    response.should render_template(:edit)
  end

  it "update action should render edit template when model is invalid" do
    VenueLocation.any_instance.stubs(:valid?).returns(false)
    put :update, :id => VenueLocation.first
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    VenueLocation.any_instance.stubs(:valid?).returns(true)
    put :update, :id => VenueLocation.first
    response.should redirect_to(venue_location_url(assigns[:venue_location]))
  end

  it "destroy action should destroy model and redirect to index action" do
    venue_location = VenueLocation.first
    delete :destroy, :id => venue_location
    response.should redirect_to(venue_locations_url)
    VenueLocation.exists?(venue_location.id).should be_false
  end
end
