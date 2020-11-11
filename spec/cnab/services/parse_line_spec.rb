require 'rails_helper'

describe CNAB::Services::ParseLine do
  context 'when service receives a line' do
    it 'verify hash line returned' do
      line = '5201903010000013200556418150633123****7687145607MARIA JOSEFINALOJA DO Ó - MATRIZ'

      expect_parsed_line = {
        type: 'recebimento_emprestimo',
        occurrence_date: '20190301',
        value: '0000013200',
        cpf: '55641815063',
        card: '3123****7687',
        hour: '145607',
        shop_owner: 'MARIA JOSEFINA',
        shop_name: 'LOJA DO Ó - MATRIZ'
      }

      parse_line = described_class.new
      subject = parse_line.call(line)

      expect(expect_parsed_line).to eq(subject.data)
    end
  end
end
