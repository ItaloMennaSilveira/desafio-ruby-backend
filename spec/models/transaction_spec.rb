require 'rails_helper'

describe Transaction do
  describe 'associations' do
    let(:transaction) { described_class.new }

    it { expect(transaction).to belong_to(:shop) }
  end

  describe "enums" do
    it {
      should define_enum_for(:transaction_type)
             .with_values(
                debito: 1,
                boleto: 2,
                financiamento: 3,
                credito: 4,
                recebimento_emprestimo: 5,
                vendas: 6,
                recebimento_ted: 7,
                recebimento_doc: 8,
                aluguel: 9
             )
    }
  end

  describe "constants" do
    POSITIVE_OPERATIONS = [
      :debito,
      :credito,
      :recebimento_emprestimo,
      :vendas,
      :recebimento_ted,
      :recebimento_doc
    ]

    NEGATIVE_OPERATIONS = [
      :boleto,
      :financiamento,
      :aluguel
    ]

    it { expect(Transaction::POSITIVE_OPERATIONS).to eq(POSITIVE_OPERATIONS) }
    it { expect(Transaction::NEGATIVE_OPERATIONS).to eq(NEGATIVE_OPERATIONS) }
  end

  describe "callbacks" do
    it { is_expected.to callback(:parse_value).before(:save) }
    it { is_expected.to callback(:parse_hour).before(:save) }
  end

  describe 'scopes' do
    describe 'positive_transactions' do
      it 'get all positive transactions based on transaction_type' do
        Transaction.delete_all

        FactoryBot.create(:transaction, transaction_type: 2)
        FactoryBot.create(:transaction, transaction_type: 1)

        result = Transaction.positive_transactions.count

        expect(result).to eq(1)
      end
    end

    describe 'negative_transactions' do
      it 'get all negative transactions based on transaction_type' do
        Transaction.delete_all

        FactoryBot.create(:transaction, transaction_type: 2)
        FactoryBot.create(:transaction, transaction_type: 2)
        FactoryBot.create(:transaction, transaction_type: 1)

        result = Transaction.negative_transactions.count

        expect(result).to eq(2)
      end
    end
  end

  describe '#balance' do
    it 'return a positive value of sum from all transactions' do
      Transaction.delete_all

      transaction = FactoryBot.create(:transaction, transaction_type: 2, value: 100.00)
      transaction2 = FactoryBot.create(:transaction, transaction_type: 1, value: 250.00)

      expect(Transaction.balance).to eq(150.00)
    end

    it 'return a negative value of sum from all transactions' do
      Transaction.delete_all

      transaction = FactoryBot.create(:transaction, transaction_type: 2, value: 100.00)
      transaction2 = FactoryBot.create(:transaction, transaction_type: 2, value: 250.00)

      expect(Transaction.balance).to eq(-350.00)
    end
  end
end



