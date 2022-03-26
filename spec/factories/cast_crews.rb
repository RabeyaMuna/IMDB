FactoryBot.define do
  factory :cast_crew do
    cast_type { :directer }
    name { Faker::Name.name  }
    post 
  end
end
