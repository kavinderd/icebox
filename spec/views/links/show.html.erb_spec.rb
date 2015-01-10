require "rails_helper"

RSpec.describe "links/show" do
  let(:subject) { Link.new(title: "Test Title") }

  it "renders the title of the link" do
    assign(:link, subject)
    render
    expect(rendered).to match /Title/
  end
end
