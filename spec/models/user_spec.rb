require 'rails_helper'

RSpec.describe User, :type => :model do

  context "authentication token" do
    
    it "sets an authentication token" do
      user = User.new
      expect(user.authentication_token).to be_nil
      user.ensure_authentication_token
      expect(user.authentication_token).to_not be_nil
    end

  end
  
end
