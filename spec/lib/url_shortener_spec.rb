require "rails_helper"

RSpec.describe UrlShortener do
  let(:number) { 2 }
  let(:hash) { 'PrSqXP' }

  describe ".encode" do
  	it "encodes number to hash" do
  	  UrlShortener.encode(number).should eq(hash)
  	end

  	context "when an argument is not a number" do
  	  let(:number) { 'string' } 

  	  it "raises an exception" do
  	  	expect { UrlShortener.encode(number) }.to raise_error(ArgumentError)
  	  end
	  end
  end

  describe ".decode" do
  	it "decodes hash to number" do
  	  UrlShortener.decode(hash).should eq(number)
  	end

  	context "when an argument is not a string" do
  	  let(:hash) { 100500 } 

  	  it "raises an exception" do
  	  	expect { UrlShortener.decode(hash) }.to raise_error(ArgumentError)
  	  end
	  end
  end
end
