require 'rails_helper'

describe CNAB::Readers::CnabFileLine do
  describe 'test data' do
    it 'test reader cnab_file_line' do
      line = '5201903010000013200556418150633123****7687145607MARIA JOSEFINALOJA DO Ó - MATRIZ'

      subject = described_class.new(line).data
      expected =
      {
        type: 'recebimento_emprestimo',
        occurrence_date: '20190301',
        value: '0000013200',
        cpf: '55641815063',
        card: '3123****7687',
        hour: "145607",
        shop_owner: 'MARIA JOSEFINA',
        shop_name: 'LOJA DO Ó - MATRIZ'
      }

      expect(subject).to eq(expected)
    end
  end
end
