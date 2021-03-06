class Shop < ApplicationRecord
  has_many :transactions
  has_one :beneficiary

  validates :name, uniqueness: true

  def balance
    positive = transactions.positive_transactions.sum('value')
    negative = transactions.negative_transactions.sum('value')

    positive - negative
  end
end
