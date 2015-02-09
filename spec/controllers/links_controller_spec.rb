require 'rails_helper'

RSpec.describe LinksController, :type => :controller do

  before(:each) do
    @user = object_double(User.new)
    @request.env["warden"] = double(Warden, authenticate: @user, authenticate!: @user)
  end

  describe "GET new" do

    before(:each) do
      @link = object_double(Link.new)
      allow(@user).to receive_message_chain(:links, :build).and_return(@link) 
    end

    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "assigns a link model" do
      expect(@user).to receive_message_chain(:links, :build).and_return(@link)
      get :new
    end
  end

  describe "POST create" do

    let(:link_params) { { "url" => "https://test.org" } }
    let(:service_class) { class_double(UrlParser).as_stubbed_const }

    it "creates a new link" do
      expect(service_class).to receive(:generate_link).with(url: link_params.fetch("url"), user: @user)
      post :create, link: link_params
    end

    it "redirects to the index path" do
      allow(service_class).to receive(:generate_link)
      post :create, link: link_params
      expect(response).to redirect_to(links_path)
    end

  end

  describe "GET index" do

    it "renders the index template" do
      allow(@user).to receive(:links)
      get :index
      expect(response).to render_template(:index)
    end

    it "sends the all method to Link" do
      expect(@user).to receive(:links)
      get :index
    end

  end

  describe "GET show" do
    before(:each) do
      @link = object_double(Link.new, url: "http://something.com")
      @pismo_dub = class_double(Pismo::Document).as_stubbed_const
    end

    it "fetches the requested link" do
      expect(@user).to receive_message_chain(:links, :find).and_return(@link)
      allow(@pismo_dub).to receive_message_chain(:new, :body)
      get :show, id: 1
    end

    it "renders the show template" do
      allow(@user).to receive_message_chain(:links, :find).and_return(@link)
      allow(@pismo_dub).to receive_message_chain(:new, :body)
      get :show, id: 1
      expect(response).to render_template(:show)
    end

    it "fetches a url's content from pismo" do
      allow(@user).to receive_message_chain(:links, :find).and_return(@link)
      expect(@pismo_dub).to receive_message_chain(:new, :body)
      get :show, id: 1
    end

  end

end
