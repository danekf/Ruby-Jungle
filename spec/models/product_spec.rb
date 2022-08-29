require 'rails_helper'

RSpec.describe Product, type: :model do
  
  before(:each) do
    #create a new product with no data passed in
    @product = Product.new
    @category = Category.new name: 'Pizza Plant'
  end


  describe 'Validations' do
    # check that a product with all data will be valid
    it "product saves when all fields are present" do
      @valid_product = Product.new(name: 'Danek', price: 1337, quantity: 23, category: @category)
      expect(@valid_product).to be_valid
      @valid_product.save
      expect(@valid_product).to be_persisted
    end
    #check that error message is present for each data point that is required
    it "product has a name" do
      expect(@product).to_not be_valid
      expect(@product.errors.messages[:name]).to include("can't be blank")
    end
    it "product has a price" do
      expect(@product).to_not be_valid
      expect(@product.errors.messages[:price]).to include("can't be blank")
    end
    it "product has a quantity" do
      expect(@product).to_not be_valid
      expect(@product.errors.messages[:quantity]).to include("can't be blank")
    end
    it "product has a category" do
      expect(@product).to_not be_valid
      expect(@product.errors.messages[:category]).to include("can't be blank")
    end
  end  
end
