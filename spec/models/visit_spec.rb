require 'rails_helper'

RSpec.describe Visit, type: :model do
  let(:visit) { Fabricate.build(:journey).visits[0] }
  it "must have a start time" do
    expect(visit.arrival).to_not be_nil
    visit.arrival = nil
    expect(visit).to_not be_valid
  end

  it "must have a journey" do
    expect(visit.journey).to be_an_instance_of(Journey)
    visit.journey = nil
    expect(visit).to_not be_valid
  end

end
