require 'rails_helper'

RSpec.describe DashboardController, :type => :controller do
  before(:each) do
    @user = object_double(User.new)
    @request.env["warden"] = double(Warden, authenticate: @user, authenticate!: @user)
  end

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end

end
