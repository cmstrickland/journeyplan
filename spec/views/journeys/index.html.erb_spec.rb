require 'rails_helper'

RSpec.describe "journeys/index", type: :view do
  before(:each) do
    assign(:journeys, [
             Fabricate(:journey), Fabricate(:journey),
    ])
  end

  it "renders a list of journeys" do
    render
  end
end
