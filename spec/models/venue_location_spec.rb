require File.dirname(__FILE__) + '/../spec_helper'

describe VenueLocation do
  it "should be valid" do
    VenueLocation.new.should be_valid
  end
end
