class Transaction < ApplicationRecord
  belongs_to :shop

  enum transaction_type: {
    debito: 1,
    boleto: 2,
    financiamento: 3,
    credito: 4,
    recebimento_emprestimo: 5,
    vendas: 6,
    recebimento_ted: 7,
    recebimento_doc: 8,
    aluguel: 9
  }

  POSITIVE_OPERATIONS = %i[
    debito
    credito
    recebimento_emprestimo
    vendas
    recebimento_ted
    recebimento_doc
  ].freeze

  NEGATIVE_OPERATIONS = %i[
    boleto
    financiamento
    aluguel
  ].freeze

  scope :positive_transactions, -> { where(transaction_type: POSITIVE_OPERATIONS) }
  scope :negative_transactions, -> { where(transaction_type: NEGATIVE_OPERATIONS) }

  before_save :parse_value
  before_save :parse_hour

  def self.balance
    positive = positive_transactions.sum('value')
    negative = negative_transactions.sum('value')

    positive - negative
  end

  private

  def parse_value
    value.to_f / 100.0
  end

  def parse_hour
    hour.insert(2, ':').insert(5, ':')
  end
end
