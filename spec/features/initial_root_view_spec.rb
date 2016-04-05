require 'rails_helper'

RSpec.feature 'First visit to the home page' , type: :feature do
  it "prompts to create negotiators when there are none" do
    visit "/"
    expect(page).to have_content("New Negotiator")
  end
end
