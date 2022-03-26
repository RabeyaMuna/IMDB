FactoryBot.define do
  factory :post_rating do
    rating { Faker::Number.between(from: 1, to: 5) }
    post 
    user
  end
end
