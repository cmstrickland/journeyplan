require 'rails_helper'

RSpec.describe Journey, type: :model do
  let(:journey) { Fabricate.build(:journey) }

  it "must belong to a negotiator" do
    expect(journey.negotiator).to be_instance_of(Negotiator)
    journey.negotiator = nil
    expect(journey).to_not be_valid
  end

  it "must have a start date" do
    expect(journey.starts).to_not be_nil
    journey.starts = nil
    expect(journey).to_not be_valid
  end

  it "must have at least one visit" do
    journey.save
    expect(journey.visits.count).to be 1
  end

  it "builds a chain of visits from a json array of locations" do
    expect{journey.build_visits}.to change { journey.visits.count }.by 5
  end

end
