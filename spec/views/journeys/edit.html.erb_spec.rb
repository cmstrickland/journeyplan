require 'rails_helper'

RSpec.describe "journeys/edit", type: :view do
  before(:each) do
    @journey = assign(:journey, Fabricate.create(:journey))
  end

  it "renders the edit journey form" do
    render

    assert_select "form[action=?][method=?]", journey_path(@journey), "post" do
    end
  end
end
