FactoryBot.define do
  factory :post do
    name { Faker::Name.name }
    description { Faker::Hipster.paragraphs  }
    link { 'https://tosbourn.com/using-faker-with-rspec/' }
    release_date { Faker::Date.in_date_period }
    director_name { Faker::Name.name }
    producer_name { Faker::Name.name }
    cast_name { Faker::Name.name }
    user
  end
end
