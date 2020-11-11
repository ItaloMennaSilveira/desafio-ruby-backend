require 'rails_helper'

describe CNAB::Services::ParseFile do
  context 'when service receives a file content' do
    it 'should create a shop beneficiary and transaction' do
      file = open("cnab.txt", 'rb')

      parse_file = described_class.new
      subject = parse_file.call(file)

      expect(Shop.count).to eq(5)
      expect(Transaction.count).to eq(21)
      expect(Beneficiary.count).to eq(4)
    end
  end
end