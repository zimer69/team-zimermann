FactoryBot.define do
  factory :athlete_profile do
    user { nil }
    first_name { "MyString" }
    last_name { "MyString" }
    height { "9.99" }
    weight { "9.99" }
    age { 1 }
    date_of_birth { "2025-08-05" }
    gender { "MyString" }
    fitness_level { "MyString" }
    goals { "MyText" }
    medical_conditions { "MyText" }
    whatsapp { "MyString" }
    city { "MyString" }
  end
end
