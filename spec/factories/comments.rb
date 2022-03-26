FactoryBot.define do
  factory :comment do
    comment { Faker::Lorem.sentences }
    post 
    user
  end
end
