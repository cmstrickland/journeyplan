require 'rails_helper'

RSpec.describe "negotiators/show", type: :view do
  before(:each) do
    @negotiator = assign(:negotiator, Fabricate(:negotiator))
  end

  it "renders attributes in <p>" do
    render
  end
end
