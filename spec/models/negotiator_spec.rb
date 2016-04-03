require 'rails_helper'

RSpec.describe Negotiator, type: :model do
  let(:negotiator) { Fabricate.build( :negotiator ) }
  it "validates username" do
    expect(negotiator).to be_valid
    negotiator.username = nil
    expect(negotiator).to_not be_valid
  end
end
