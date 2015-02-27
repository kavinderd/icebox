require "rails_helper"

RSpec.describe "User Login via API" do

  before(:each) do
    @user = User.create!(email: 'test@test.com', password: 'testtest', password_confirmation: 'testtest')
  end

  context "when the login information is valid" do

    it "returns the authorization token" do
      post "/api/v1/signin", { user: {email: @user.email, password: 'testtest'} } 
      body = JSON.parse(response.body)
      expect(body["authentication_token"]).to eq(@user.authentication_token)
      expect(body["email"]).to eq(@user.email)
    end

  end

  context "when the login information is invalid" do

    it "returns an error message" do
      post "/api/v1/signin", { email: 'invalid@email.com', password: 'testpass' }
      body = JSON.parse(response.body)
      expect(body["error"]).to eq("Invalid Email or Password")
    end

  end
end
