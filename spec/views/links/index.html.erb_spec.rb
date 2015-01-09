require 'rails_helper'

RSpec.describe "links/index" do

  let(:links) do 
    [
     object_double(Link.new, title: "Test Title"),
     object_double(Link.new, title: "A Great Title")
    ]
  end 

  it "renders the title of each @links" do
    render
    expect(rendered).to match /A Great Title/
    expect(rendered).to match /Test Title/
  end
end
