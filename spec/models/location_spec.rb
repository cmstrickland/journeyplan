require 'rails_helper'

RSpec.describe Location, type: :model do
  let (:location) { Fabricate.build(:location) }
  it "always has co-ordinates" do
    expect(location.latitude).to_not be_nil
    expect(location.longitude).to_not be_nil
    expect(location).to be_valid

    location.latitude = location.longitude = nil
    expect(location).to_not be_valid
  end

  it "has unique co-ordinates" do
    location.save
    dupe = Fabricate.build(:location, latitude: location.latitude,
                            longitude: location.longitude )
    expect(dupe).to_not be_valid
  end

  it "doesn't have to have a name" do
    location.name = nil
    expect(location).to be_valid
  end



end
