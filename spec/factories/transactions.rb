FactoryBot.define do
  factory :transaction do
    transaction_type { rand(1..9) }
    occurrence_date { '2020-01-09' }
    value { rand(10_000_000.0) }
    credit_card { Faker::Finance.credit_card }
    hour { '120100' }
    shop { create(:shop) }
  end
end
