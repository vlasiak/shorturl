require "rails_helper"

RSpec.describe LinksController, :type => :controller do
  describe "GET #new" do
  	before do
  	  get :new
	  end

    it "responds successfully with an HTTP 200 status code" do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the new template" do
      expect(response).to render_template('new')
    end
  end

  describe "POST #create" do
  	let(:href) { 'https://google.com' }
  	let(:request) { xhr :post, :create, href: href }

    it "responds successfully with an HTTP 200 status code" do
      request

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the create template" do
      request

      expect(response).to render_template('create')
    end

    it "creates Link object in the database" do
      expect { request }.to change { Link.count }.by(1)
	  end

    it "builds a hash and places it into @hash" do
      request

      expect(assigns(:hash)).to_not be_blank
    end

    context "when href is not present" do
      let(:href) { '' }

	    it "raises an exception" do
	  	  expect { request }.to raise_error
  	  end
	  end
  end
end
