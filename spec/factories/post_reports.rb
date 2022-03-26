FactoryBot.define do
  factory :post_report do
    message { Faker::Lorem.sentences }
    post 
    user
  end
end
