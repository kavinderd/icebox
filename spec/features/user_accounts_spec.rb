require "rails_helper"

feature "User Accounts" do

  scenario "A User can sign up for an account" do
    visit "/signup"
    fill_in "user_email", with: "tester@test.com"
    fill_in "user_password", with: "testpassword"
    fill_in "user_password_confirmation", with: "testpassword"
    click_button "Sign up"
    expect(page).to have_content("You're Signed Up!")
    expect(page).to have_content("My Profile")
  end
  
end
