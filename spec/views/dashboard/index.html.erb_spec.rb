require 'rails_helper'

RSpec.describe "dashboard/index.html.erb", :type => :view do
  pending "add some examples to (or delete) #{__FILE__}"
  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    user = User.create(email: 'test@test.com', password: 'password', password_confirmation: 'password')
    sign_in user
  end

  it "renders the dashboard title" do
    render
    expect(rendered).to match /Dashboard/
  end

  it "renders a link to links index path" do
    render
    expect(rendered).to match /Links/
  end

end
