FactoryGirl.define do

  factory :team do
    name { Faker::Company.name }
    country { Faker::Address.country }
    engine_manufacturer { Faker::Company.name }
    debut_year { Faker::Number.between(1940, 2000) }
    number_of_constructor_championship { Faker::Number.between(0, 20) }
    number_of_driver_championship { Faker::Number.between(0, 20) }
    number_of_poles { Faker::Number.between(5, 220) }

    transient do
      driver_count 3
    end

    factory :team_with_drivers do
      after(:create) do |team, evaluator|
        evaluator.driver_count.times do
          team.drivers << build(:driver)
        end
      end
    end
  end

end
