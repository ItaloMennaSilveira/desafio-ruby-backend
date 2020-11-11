FactoryBot.define do
  factory :beneficiary do
    name { Faker::Name.name }
    cpf { "123421242232" }
  end
end
