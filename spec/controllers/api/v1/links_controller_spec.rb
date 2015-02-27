require 'rails_helper'

RSpec.describe Api::V1::LinksController, :type => :controller do

  before(:each) do
    @user = object_double(User.new)
    @request.env["warden"] = double(Warden, authenticate: @user, authenticate!: @user)
    allow(controller).to receive(:authenticate_user_from_token!).and_return(true)
  end

  describe "POST create" do

    let(:link_params) { { "url" => "https://test.org" } }
    let(:service_class) { class_double(UrlParser).as_stubbed_const }

    it "creates a new link" do
      expect(service_class).to receive(:generate_link).with(url: link_params.fetch("url"), user: @user)
      post :create, link: link_params
    end

  end

end
