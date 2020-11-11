class Beneficiary < ApplicationRecord
  belongs_to :shop

  validates :cpf, uniqueness: true
end
