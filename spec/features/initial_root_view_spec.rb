require 'rails_helper'

RSpec.feature 'First visit to the home page' , type: :feature do
  let(:username) { Faker::Internet.user_name }
  it "prompts to create negotiators when there are none" do
    visit "/"
    expect(page).to have_content("New Negotiator")
    expect(page).to have_css "p#notice", text: /\S+/
    fill_in "Username", with: username
    find('#create_negotiator').click
    # now we can visit / and we should end up at new journey
    visit "/"
    expect(page).to have_css "p#notice", text: /^$/
    expect(page).to have_css "form#new_journey"
    expect(page).to have_css "option", text: username
  end
end
