FactoryBot.define do
  factory :subscription do
    user { nil }
    plan { nil }
    status { 1 }
    start_date { "2025-08-07" }
    end_date { "2025-08-07" }
    payment_date { "2025-08-07" }
    next_payment_date { "2025-08-07" }
  end
end
