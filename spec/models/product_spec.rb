require 'rails_helper'

RSpec.describe Product, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe 'Validations' do
    # validation tests/examples here
    # validates :name, presence: true
    it "Should return Name can't be blank" do
      @category = Category.new
      @product = Product.new(name: 'Jump Rope', price_cents: 400, quantity: 10, category: @category)
      # @product.save!

      # expect(@product.name).to be_present
      @product.name = nil
      @product.save
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'Should find a price' do
      @category = Category.new
      @product = Product.new(name: 'Jump Rope', price_cents: 400, quantity: 10, category: @category)
      # @product.save!

      @product.price_cents = nil
      @product.save

      # expect(@product.price).to be_present
      expect(@product.errors.full_messages).to include("Price cents is not a number", "Price is not a number", "Price can't be blank")
    end

    it 'Should find quantity' do
      @category = Category.new
      @product = Product.new(name: 'Jump Rope', price_cents: 400, quantity: 10, category: @category)
      # @product.save!

      @product.quantity = nil
      @product.save
      # expect(@product.quantity).to be_present
      expect(@product.errors.full_messages).to include("Quantity can't be blank")

    end

    it 'Should find the category' do
      @category = Category.new(name: 'Toy')
      @product = Product.new(name: 'Jump Rope', price_cents: 400, quantity: 10, category: @category)
      # @product.save

      @product.category = nil
      @product.save
      # expect(@product.category).to be_present
      expect(@product.errors.full_messages).to include("Category can't be blank")

    end
  end
end