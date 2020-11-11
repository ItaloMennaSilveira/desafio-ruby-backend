require 'rails_helper'

describe Shop do
  describe 'associations' do
    let(:shop) { described_class.new }

    it { expect(shop).to have_many(:transactions) }
    it { expect(shop).to have_one(:beneficiary) }
  end

  describe 'validations' do
    it { should validate_uniqueness_of(:name) }
  end

  describe '#balance' do
    it 'return a positive value of sum from all transactions' do
      shop = FactoryBot.create(:shop)
      transaction = FactoryBot.create(:transaction, shop: shop, transaction_type: 2, value: 100.00)
      transaction2 = FactoryBot.create(:transaction, shop: shop, transaction_type: 1, value: 250.00)

      expect(shop.balance).to eq(150.00)
    end

    it 'return a negative value of sum from all transactions' do
      shop = FactoryBot.create(:shop)
      transaction = FactoryBot.create(:transaction, shop: shop, transaction_type: 2, value: 100.00)
      transaction2 = FactoryBot.create(:transaction, shop: shop, transaction_type: 2, value: 250.00)

      expect(shop.balance).to eq(-350.00)
    end
  end
end
