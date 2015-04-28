require "rails_helper"

feature "Update Link Status" do
  background do
    @user = User.create(email: 'testuser@test.com', password: 'testpassword', password_confirmation: 'testpassword')
    UrlParser.generate_link(url: "http://6ftdan.com/allyourdev/2015/02/07/do-it-all-with-ruby/#IRRR", user: @user)
    visit "/signin"
    fill_in "user_email", with: @user.email
    fill_in "user_password", with: 'testpassword'
    click_button "Log in"
  end

  scenario "User marks the link as read" do
    visit "/links"
    expect(page).to have_content("Do It All With Ruby")
    click_link "Do It All With Ruby"
    click_button "Mark as Read"
    expect(page).to_not have_content("Do It All With Ruby")
  end

end
