FactoryBot.define do
  factory :report do
    body { Faker::Lorem.sentences }
    user 
    comment
  end
end
