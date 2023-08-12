FactoryBot.define do
  factory :food do
    name { 'Apple' }
    measurement_unit { 'grams' }
    price { 30 }
    quantity { 10 }
    association :user, factory: :user
  end
end
