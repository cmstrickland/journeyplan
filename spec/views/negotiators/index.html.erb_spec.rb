require 'rails_helper'

RSpec.describe "negotiators/index", type: :view do
  let(:negotiators) { [
                        Fabricate(:negotiator),
                        Fabricate(:negotiator),
                      ] }

  before(:each) do
    assign(:negotiators, negotiators)
  end

  it "renders a list of negotiators" do
    render
    negotiators.each do |negotiator|
      expect(rendered).to have_content(negotiator.username)
    end
  end
end
