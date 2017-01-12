require "rails_helper"

RSpec.describe 'Routing', :type => :routing do
  describe "Request catching" do
    let(:hash) { 'xUert' }

    it "is handled by links#new" do
      expect(get: '/').to route_to(
        controller: 'links',
        action: 'new'
      )
    end

    it "is handled by redirects#perform" do
      expect(get: "/#{hash}").to route_to(
        controller: 'redirects',
        action: 'perform',
        hash: hash
      )
    end

    it "is not routable" do
      expect(:get => "/unexisting/route").not_to be_routable
    end
  end
end
