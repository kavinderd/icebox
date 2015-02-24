require "rails_helper"

RSpec.describe "User Login via API" do

  before(:each) do
    @user = User.create!(email: 'test@test.com', password: 'testtest', password_confirmation: 'testtest')
  end

  context "when the login information is valid" do

    it "returns the authorization token" do
      response = post "/api/v1/sessions", { email: @user.email, password: 'testtest' } 
      body = JSON.parse(response.body)
      expect(body["token"]).to eq(@user.authorization_token)
    end

  end

  context "when the login information is invalid" do

    it "returns an error message" do
      response = post "/api/v1/sessions", { email: 'invalid@email.com', password: 'testpass' }
      body = JSON.parse(response.body)
      expect(body["error"]).to eq("Invalid Email or Password")
    end

  end
end
