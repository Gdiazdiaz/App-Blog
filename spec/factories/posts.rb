FactoryBot.define do
  factory :post do
    title { Faker::Quote }
    text { Faker::Quote }
    association :author, factory: :user
  end
end
