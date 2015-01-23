require 'rails_helper'

RSpec.describe "welcome/index.html.erb", :type => :view do

  it "renders the title" do
    render
    expect(rendered).to match /Welcome to Icebox/
  end
end
