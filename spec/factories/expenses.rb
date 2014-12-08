FactoryGirl.define do
  factory :expense do
    association :user
    description { Faker::Lorem.sentence }
    amount_cents { Faker::Number.number(4) } 
  end
end
