FactoryGirl.define do
  factory :driver do
    name { Faker::GameOfThrones.character }
    nationality { Faker::Address.country }
    age { Faker::Number.between(20, 42) }
    poles { Faker::Number.between(0, 66) }
    number_of_championships { Faker::Number.between(0, 8) }
    team
  end
end
