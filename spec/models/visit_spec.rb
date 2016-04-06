require 'rails_helper'

RSpec.describe Visit, type: :model do
  let(:visit) { Fabricate(:journey).visits[0] }
  it "must have a start time" do
    expect(visit.arrival).to_not be_nil
  end

  it "must have a journey" do
    expect(visit.journey).to be_an_instance_of(Journey)
    visit.journey = nil
    expect(visit).to_not be_valid
  end

  context "building a visit from a visit and a destination" do
    let(:location) { Fabricate.build(:location) }
    let(:next_visit) { visit.build_visit_to(location: location) }

    it "adds to a journeys visit set" do
      expect {
        next_visit = visit.build_visit_to(location: location)
      }.to change { visit.journey.visits.count} .by 1
    end

    it "returns a Visit object" do
      expect(next_visit).to be_an_instance_of(Visit)
    end

    it "sets the correct location of the next visit" do
      expect(next_visit.location).to eq(location)
    end

    it "computes the arrival to be in the future" do
      expect(visit_in_future(visit.arrival,next_visit.arrival)).to eq true
    end

  end

end
