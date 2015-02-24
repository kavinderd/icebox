require "rails_helper"

RSpec.describe 'Link Create via JSON' do
  
  before(:each) do
    user = User.create!(email: 'test@test.com', password: 'testtest', password_confirmation: 'testtest')
    login_response = post "/api/v1/sessions", { email: 'test@test.com', password: 'testtest' }
    @token = JSON.parse(login_response.body)["token"]
  end

  it "successfully saves the link" do
    link = "http://www.mayerdan.com/programming/2015/02/21/cache-me-if-you-can/"
    response = post "/api/v1/sessions", { link: link, token: @token }
    body = JSON.parse(repsonse.body)
    expect(body["message"]).to eq("Link Saved")
  end

end

