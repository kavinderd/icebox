require "rails_helper"

RSpec.describe UrlParser do
  
  context "#generate_link" do

    before(:each) do
      @class_dub = class_double(Link).as_stubbed_const
      @user = object_double(User.new)
      @pismo = class_double(Pismo::Document).as_stubbed_const
      @doc = double("doc", title: "Test Title")
    end


    it "retrieves the url title from Pismo::Document" do
      expect(@pismo).to receive(:new).with("http://www.mikeperham.com/2015/01/05/cgi-rubys-bare-metal/").and_return(@doc)
      allow(@user).to receive_message_chain(:links, :build, :save!)
      UrlParser.generate_link(url:"http://www.mikeperham.com/2015/01/05/cgi-rubys-bare-metal/", user: @user)
    end

    it "generates a new link with parsed information" do
      allow(@pismo).to receive(:new).with("http://www.mikeperham.com/2015/01/05/cgi-rubys-bare-metal/").and_return(@doc)
      expect(@user).to receive_message_chain(:links, :build, :save!)
      UrlParser.generate_link(url:"http://www.mikeperham.com/2015/01/05/cgi-rubys-bare-metal/", user: @user)
    end

  end
end
