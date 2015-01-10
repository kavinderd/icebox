require "rails_helper"

RSpec.describe "links/show" do
  let(:subject) { Link.new(title: "Test Title") }
  let(:content) { "This is the content of a website" }

  before(:each) do
    assign(:link, subject)
    assign(:content, content)
  end

  it "renders the title of the link" do
    render
    expect(rendered).to match /Title/
  end

  it "renders @content" do
    render
    expect(rendered).to match /is the content/
  end
end
