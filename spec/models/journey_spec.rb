require 'rails_helper'

def visit_in_future (v1,v2)
  return true if v1.nil?
  return true if v2.nil?
  return true if (v1 < v2 )
end

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

  it "handles duplicate locations through truncation " do
    journey.locations = %Q|[{"lat":51.511263842468516,"lng":-0.10557174682617188},
{"lat":51.53561579082792,"lng":-0.2549171447753906},
{"lat":51.53561571082792,"lng":-0.254917144}]|
    expect{journey.build_visits}.to change{ journey.visits.count }.by 4
  end
  it "builds visits with an incrementing timeline" do
    visits =journey.build_visits.all
    visits.each_with_index do |v,i|
      if i+1 < visits.count
        expect(visit_in_future(v.arrival,visits[i+1].arrival)).to eq true
      end
    end
  end
end
