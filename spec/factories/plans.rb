FactoryBot.define do
  factory :plan do
    name { "MyString" }
    price { "9.99" }
    duration_days { 1 }
    description { "MyText" }
    active { false }
  end
end
