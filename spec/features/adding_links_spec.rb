require 'rails_helper'

feature 'Adding links' do

  background do
    @user = User.create(email: 'testuser@test.com', password: 'testpassword', password_confirmation: 'testpassword')
    @user2 = User.create(email: 'testuser2@test.com', password: 'testpassword', password_confirmation: 'testpassword')
    UrlParser.generate_link(url: "http://6ftdan.com/allyourdev/2015/02/07/do-it-all-with-ruby/#IRRR", user: @user2)
    visit "/signin"
    fill_in "user_email", with: @user.email
    fill_in "user_password", with: 'testpassword'
    click_button "Log in"
  end

  scenario "User enters a new link" do
    visit "/links/new"
    fill_in "Url", with: "https://www.ruby-lang.org/en/about/"
    click_button "Submit"
    expect(page).to have_text("Link was successfully created")
    expect(page).to have_content("The Ideals of Ruby's Creator")
    expect(page).to_not have_content("Do It All With Ruby")
  end

end
