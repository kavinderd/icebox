require "rails_helper"

RSpec.describe UrlParser do
  
  context "#generate_link" do

    before(:each) do
      @class_dub = class_double(Link).as_stubbed_const
    end

    it "generates a new link with parsed information" do
      expect(@class_dub).to receive(:create).with(title: "CGI: Ruby's Bare Metal", url: "http://www.mikeperham.com/2015/01/05/cgi-rubys-bare-metal/")
      UrlParser.generate_link("http://www.mikeperham.com/2015/01/05/cgi-rubys-bare-metal/")
    end

  end
end
