FactoryBot.define do
  factory :novel do
    association :user
    title { Faker::Lorem.word }
    user_id { Faker::Number.between(from: 1, to: 10) }
  end
end