require 'rails_helper'

RSpec.describe WelcomeController, :type => :controller do

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "renders the index template" do
      get :index 
      expect(response).to render_template(:index)
    end

    context "when the user is signed in" do
      before(:each) do
        @user = object_double(User.new)
        @request.env["warden"] = double(Warden, authenticate: @user, authenticate!: @user)
      end

      it "redirects to the dashboard page" do
        get :index
        expect(response).to redirect_to(dashboard_index_path)
      end
    end

  end

end
