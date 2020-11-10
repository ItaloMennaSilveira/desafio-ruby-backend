module CNAB
  module Readers
    class CnabFileLine
      attr_reader :line

      def initialize(line)
        @line = line
      end

      def data
        {
          type: transaction_type.strip,
          occurrence_date: occurrence_date.strip,
          value: value.strip,
          cpf: cpf.strip,
          card: card.strip,
          hour: hour.strip,
          shop_owner: shop_owner.strip,
          shop_name: shop_name.strip
        }
      end

      def type
        line[0]
      end

      def transaction_type
        case type
        when CNAB::Constants::TransactionTypes::DEBITO
          'debito'
        when CNAB::Constants::TransactionTypes::BOLETO
          'boleto'
        when CNAB::Constants::TransactionTypes::FINANCIAMENTO
          'financiamento'
        when CNAB::Constants::TransactionTypes::CREDITO
          'credito'
        when CNAB::Constants::TransactionTypes::RECEBIMENTO_EMPRESTIMO
          'recebimento_emprestimo'
        when CNAB::Constants::TransactionTypes::VENDAS
          'vendas'
        when CNAB::Constants::TransactionTypes::RECEBIMENTO_TED
          'recebimento_ted'
        when CNAB::Constants::TransactionTypes::RECEBIMENTO_DOC
          'recebimento_doc'
        when CNAB::Constants::TransactionTypes::ALUGUEL
          'aluguel'
        else
          'NOT_FOUND'
        end
      end

      def occurrence_date
        line[1..8]
      end

      def value
        line[9..18]
      end

      def cpf
        line[19..29]
      end

      def card
        line[30..41]
      end

      def hour
        line[42..47]
      end

      def shop_owner
        line[48..61]
      end

      def shop_name
        line[62..80]
      end
    end
  end
end
