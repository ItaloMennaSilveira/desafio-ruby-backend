require 'rails_helper'


describe CNAB::Services::ProcessFile do
    describe 'when service receives a file content' do
      it 'should call the parse file to process' do
        file = open("cnab.txt", 'rb')

        parse_file = described_class.new
        subject = parse_file.call(file)

        expect(Shop.count).to eq(5)
        expect(Transaction.count).to eq(21)
        expect(Beneficiary.count).to eq(4)
      end
    end
  end
