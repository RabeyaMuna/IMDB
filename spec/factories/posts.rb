FactoryBot.define do
  factory :post do
    name { Faker::Movie.name }
    description { Faker::Hipster.paragraphs  }
    link { 'https://tosbourn.com/using-faker-with-rspec/' }
    release_date { Faker::Date.in_date_period }
    user
  end
end
