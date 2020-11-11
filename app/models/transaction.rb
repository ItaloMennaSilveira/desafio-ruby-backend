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
end
