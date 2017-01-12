require "rails_helper"

RSpec.describe NumberMapper do
  let(:initial_number) { 2 }
  let(:encrypted_number) { 854854756 }

  describe "#initialize" do
    context "when an argument is not a number" do
      it "raises an exception" do
        expect { NumberMapper.new('string') }.to raise_error(ArgumentError)
      end
    end
  end

  describe "#encrypt" do
    it "maps number to another number" do
      NumberMapper.new(initial_number).encrypt.should eq(encrypted_number)
    end
  end

  describe "#decrypt" do
    it "maps encrypted number back to initial one" do
      NumberMapper.new(encrypted_number).decrypt.should eq(initial_number)
    end
  end
end
