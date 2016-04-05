require 'rails_helper'

RSpec.feature 'First visit to the home page' , type: :feature do
  it "prompts to create negotiators when there are none" do
    visit "/"
    expect(page).to have_content("New Negotiator")
    expect(page).to have_css "p#notice", text: /\S+/
    fill_in "Username", with: Faker::Internet::user_name
    find('#create_negotiator').click
    # now we can visit / and we should end up at new journey
    visit "/"
    expect(page).to have_css "p#notice", text: /^$/
    expect(page).to have_css "form#new_journey"
  end
end
