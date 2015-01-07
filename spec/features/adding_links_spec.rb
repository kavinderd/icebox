require 'rails_helper'

feature 'Adding links' do

  scenario "User enters a new link" do
    visit "/links/new"
    fill_in "Url", with: "https://www.ruby-lang.org/en/about/"
    click_button "Submit"
    expect(page).to have_text("Link was successfully created")
  end

end
