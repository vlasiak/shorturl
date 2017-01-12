require "rails_helper"

RSpec.describe RedirectsController, :type => :controller do
  describe "GET #perform" do
  	let(:link) { FactoryGirl.create(:link) }
  	
  	before do
  	  UrlShortener.stub(:decode) { link.id }
  	  get :perform, hash: 'hash'
  	end

    it "redirects to original url" do
      expect(response).to redirect_to link.href
    end

    context "when there is no such Link object" do
      let(:link) { OpenStruct.new(id: 100500) }

      it "redirects to 404 page" do
      	expect(response.status).to eq(404)
      end
	  end
  end
end
