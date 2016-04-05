require 'rails_helper'

RSpec.describe "journeys/show", type: :view do
  before(:each) do
    @journey = assign(:journey, Fabricate(:journey))
  end

  it "renders attributes in <p>" do
    render
  end
end
