require 'rails_helper'

RSpec.describe "links/index" do
  
  let(:subject) do 
    [
      Link.new(title: "A Great Title"),
      Link.new(title: "Test Title")
    ]
  end 

  it "renders the title of each @links" do
    assign(:links, subject)
    render
    expect(rendered).to match /A Great Title/
    expect(rendered).to match /Test Title/
  end

  it "renders a link to links#new" do
    render
    expect(rendered).to match /New Link/
  end
end
