FactoryBot.define do
  factory :post do
    name { Faker::Lorem.sentences(number: 1) }
    description { Faker::Hipster.paragraphs  }
    link { 'https://tosbourn.com/using-faker-with-rspec/' }
    release_date { Faker::Date.in_date_period }
    user
  end
end
