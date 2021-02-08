# spec/factories/todos.rb
FactoryBot.define do
  factory :favorite do
    association :liker, factory: :user
    association :liked, factory: :novel
    liker_id { Faker::Number.between(from: 1, to: 10) }
    liked_id { Faker::Number.between(from: 1, to: 10) }
  end
end