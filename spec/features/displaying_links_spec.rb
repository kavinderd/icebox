require "rails_helper"

feature "Displaying Saved Links" do

  scenario "User selects a link from a list of saved links" do
    setup_links
    visit "/links"
    click_link "CGI: Ruby's Bare Metal"
    expect(page).to have_text("The script then outputs the HTTP response back as STDOUT")
  end

  def setup_links
    Link.create(url:"http://www.mikeperham.com/2015/01/05/cgi-rubys-bare-metal/")
  end

end
