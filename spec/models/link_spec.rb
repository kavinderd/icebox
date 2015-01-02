require 'rails_helper'

RSpec.describe Link, :type => :model do

  context "validity" do
    let(:subject) { Link.new(url: "https://test.org") }

    it "requires a url" do
      expect(subject).to be_valid
      subject.url = nil
      expect(subject).to be_invalid
    end
  end
end
