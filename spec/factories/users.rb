FactoryBot.define do
  factory :user do
    name { Gimei.name.kanji }
    email { Faker::Internet.free_email }
    division { '生産部' }
    password { Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation { password }
  end
end
