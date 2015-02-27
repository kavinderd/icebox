require "rails_helper"

RSpec.describe 'Link Create via JSON' do
  
  before(:each) do
    user = User.create!(email: 'test@test.com', password: 'testtest', password_confirmation: 'testtest')
    @token = user.authentication_token
    @email = user.email
  end

  it "successfully saves the link" do
    link = "http://www.mayerdan.com/programming/2015/02/21/cache-me-if-you-can/"
    post "/api/v1/links", { link: { url: link }  }, { "X-API-EMAIL" => @email, "X-API-TOKEN" => @token}
    body = JSON.parse(response.body)
    expect(body["url"]).to eq(link)
  end

end

