require 'rails_helper'

RSpec.describe "negotiators/new", type: :view do
  before(:each) do
    assign(:negotiator, Negotiator.new())
  end

  it "renders new negotiator form" do
    render

    assert_select "form[action=?][method=?]", negotiators_path, "post" do
    end
  end
end
