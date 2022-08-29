require 'rails_helper'

RSpec.describe Product, type: :model do
  
  before(:each) do
    @product = Product.new
    @category = Category.new name: 'Pizza Plant'
  end

  describe 'Product Validations' do
    it "product has a name" do
      @product = Product.new(name: 'Danek', price: 1337, quantity: 23, category: @category)
    end

    it "product has a price" do
      skip
      @product = Product.new(name: 'Danek', price: 1337, quantity: 23, category: @category)
    end

    it "product has a quantity" do
      skip
      @product = Product.new(name: 'Danek', price: 1337, quantity: 23, category: @category)
    end

    it "product has a category" do
      skip
      @product = Product.new(name: 'Danek', price: 1337, quantity: 23, category: @category)
    end

    it "saves when all fields are present" do
      @valid_product = Product.new(name: 'Danek', price: 1337, quantity: 23, category: @category)
      expect(@valid_product).to be_valid
    end

  end
  
end
