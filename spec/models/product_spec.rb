require 'rails_helper'

RSpec.describe Product, type: :model do
  context 'check name' do 
    it 'shoul be ok' do
      product = build(:product)
      expect(product).to be_valid
    end 

    it 'when the name is nil' do
      product = build(:product, name: '')
      expect(product).to_not be_valid
    end 

    it 'when the name is under 3 characters' do
      product = build(:product, name: 'ab')
      expect(product).to be_invalid
    end
  end

  describe 'factory' do
    context 'when normal factory' do
      it 'be valid' do
        product = build(:product)
        expect(product).to be_valid
      end
    end 
  end
  describe 'validation' do
    context 'when product does not have a description' do
      it { expect(build(:product, name: nil)).to be_invalid }
    end

    context 'when product description is under 10 characters' do
      it { expect(build(:product, description: "abcd")).to be_invalid }
    end

    context 'when product does not have a price' do
      it { expect(build(:product, price: nil)).to be_invalid }
    end

    context 'when product price is not a number' do
      it { expect(build(:product, price: 'price')).to be_invalid }
    end
  end
end
