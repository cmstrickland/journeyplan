require 'rails_helper'

RSpec.describe "negotiators/index", type: :view do
  before(:each) do
    assign(:negotiators, [
             Fabricate(:negotiator),
             Fabricate(:negotiator),
    ])
  end

  it "renders a list of negotiators" do
    render
  end
end
