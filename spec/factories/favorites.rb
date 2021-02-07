# spec/factories/todos.rb
FactoryBot.define do
  factory :favorite do
    liker_id { Faker::Number.number(10) }
    liker_id { Faker::Number.number(10) }
  end
end