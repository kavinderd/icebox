require "rails_helper"

feature "Displaying Saved Links" do

  scenario "User selects a link from a list of saved links" do
    visit "/links/new"
    fill_in "Url", with: "http://www.mikeperham.com/2015/01/05/cgi-rubys-bare-metal/"
    click_button "Submit"
    click_link "CGI: Ruby's Bare Metal"
    expect(page).to have_text("The script then outputs the HTTP response back as STDOUT")
  end

end
