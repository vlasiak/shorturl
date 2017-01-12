require "rails_helper"

RSpec.describe Link, :type => :model do
  describe "validation" do
  	let(:href) { 'https://google.com' }
  	let(:link) { FactoryGirl.build(:link, href: href) }

  	let(:subject) { link.valid? }

  	it { should be true }

  	context "when href is blank" do
  	  let(:href) { '' }

  	  it { should be false }
  	end
  end
end
