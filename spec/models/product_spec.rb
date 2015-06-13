require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "validations" do
  	it { should validate_presence_of :name }
  	it { should validate_uniqueness_of :name }
  	it { should validate_presence_of :price }
  	it { should validate_presence_of :client }
  end

  describe "associations" do
  end

  it "defaults archived to false" do
  	expect(Product.new).to_not be_archived
  end
end
