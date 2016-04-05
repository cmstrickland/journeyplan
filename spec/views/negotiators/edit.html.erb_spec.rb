require 'rails_helper'

RSpec.describe "negotiators/edit", type: :view do
  before(:each) do
    @negotiator = assign(:negotiator, Fabricate(:negotiator))
  end

  it "renders the edit negotiator form" do
    render

    assert_select "form[action=?][method=?]", negotiator_path(@negotiator), "post" do
    end
  end
end
