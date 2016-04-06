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

  it "builds visits with an incrementing timeline" do
    visits =journey.build_visits.all
    visits.each_with_index do |v,i|
      if i+1 < visits.count
        expect(v.arrival).to be < visits[i+1].arrival
      end
    end
  end
end
