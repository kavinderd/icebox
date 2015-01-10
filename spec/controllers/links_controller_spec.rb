require 'rails_helper'

RSpec.describe LinksController, :type => :controller do

  describe "GET new" do

    before(:each) do
      @link = object_double(Link.new)
      @link_class = class_double(Link).as_stubbed_const
      allow(@link_class).to receive(:new).and_return(@link) 
    end

    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "assigns a link model" do
      expect(@link_class).to receive(:new).and_return(@link)
      get :new
    end
  end

  describe "POST create" do

    let(:link_params) { { "url" => "https://test.org" } }
    let(:service_class) { class_double(UrlParser).as_stubbed_const }

    it "creates a new link" do
      expect(service_class).to receive(:generate_link).with(link_params.fetch("url"))
      post :create, link: link_params
    end

    it "redirects to the index path" do
      allow(service_class).to receive(:generate_link)
      post :create, link: link_params
      expect(response).to redirect_to(links_path)
    end

  end

  describe "GET index" do

    let(:link_class) { class_double(Link).as_stubbed_const }

    it "renders the index template" do
      allow(link_class).to receive(:all)
      get :index
      expect(response).to render_template(:index)
    end

    it "sends the all method to Link" do
      expect(link_class).to receive(:all)
      get :index
    end

  end

  describe "GET show" do
    before(:each) do
      @link = object_double(Link.new)
      @link_class = class_double(Link).as_stubbed_const
    end

    it "fetches the requested link" do
      expect(@link_class).to receive(:find).with("1").and_return(@link)
      get :show, id: 1
    end

    it "renders the show template" do
      allow(@link_class).to receive(:find)
      get :show, id: 1
      expect(response).to render_template(:show)
    end
  end

end
