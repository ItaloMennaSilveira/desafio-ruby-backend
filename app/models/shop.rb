class Shop < ApplicationRecord
  has_many :transactions
  has_one :beneficiary

  validates :name, uniqueness: true
end
